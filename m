Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EC0624700
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 17:31:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otAQo-0007OP-S3; Thu, 10 Nov 2022 11:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otAQm-0007OC-Ll
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 11:29:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otAQk-0003zC-Lv
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 11:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668097768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izypq1FJFQgpUSg8lE7GKeyl2LPNZrjmX4reSN1jshQ=;
 b=IGQkS5ThIp16zx9r7pbGjmXLPOWIOqp05Zk82eIEX0mlnfT/6Sy31M6g/ejC/DX8TgJDdx
 x8K6nJDJEAgdCGeLrk6gYD5/EWIAWjmhJ4+kvkn1ShzuKVjG0y1mVpQA3hMKdVef+LLI2b
 r98ZzvmBihlqpx25YOhQcpOlgrel+IQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-yftsk_TzP0yubbnt5B6EXg-1; Thu, 10 Nov 2022 11:29:27 -0500
X-MC-Unique: yftsk_TzP0yubbnt5B6EXg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso1222127wms.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 08:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=izypq1FJFQgpUSg8lE7GKeyl2LPNZrjmX4reSN1jshQ=;
 b=yT7wRmBTWUEgurq6HZB5F87OYY79r0f1HAS9Y0UeFsOK/+QCFP0VO13c3wv0KlAwON
 oOAZDuxqkh5x493rEekpccRkKwtp+iqz6RJlkmX5RbFF450NkqhknHzFnXKUj3JBnEeD
 sc/6PuQ6ZRrLz2PPt6XnWju0SEpTE9kqU/2Ocq+w1KLMti2GWrBWcE1SYAN/uUy76b+q
 71e9U8hljrEwzGpjAwJb6g7RyH7iLJrp1/ILONQwjoGvMEHlBcfeAAb8xZhR77al/Qr6
 sSfeHB5U9/Y/u7NeMKvDIBfRsWajZHaOJpBri6pcj5rLsKn+CdzqOwsAcCPolOvotNoH
 fqVA==
X-Gm-Message-State: ACrzQf2Ia+lt1dcGvRQn0z/tJg/Wi+3QFPMu1vpBuaGsej9hrmcar5oH
 Uqpva0YB+87hKjONQDu5cvYF3b2lwa6Hr1gXS86n7etdwCGvpZMUO6OOfc7hw0ilNkWOXKfPzep
 vNGGLDpmDSHkixK0=
X-Received: by 2002:a1c:448b:0:b0:3cf:6fcd:e171 with SMTP id
 r133-20020a1c448b000000b003cf6fcde171mr40838366wma.163.1668097765893; 
 Thu, 10 Nov 2022 08:29:25 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7vRGn68dc6MqNh8KizYNINsE7v5ztlBOdpf7pwzNgkN8zJWIWgDwGIMia9Cvg/sYSa4RPFkw==
X-Received: by 2002:a1c:448b:0:b0:3cf:6fcd:e171 with SMTP id
 r133-20020a1c448b000000b003cf6fcde171mr40838345wma.163.1668097765608; 
 Thu, 10 Nov 2022 08:29:25 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 iw2-20020a05600c54c200b003cf77e6091bsm5419392wmb.11.2022.11.10.08.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:29:24 -0800 (PST)
Date: Thu, 10 Nov 2022 11:29:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH 0/4] hw: make TCO watchdog actually work by default for Q35
Message-ID: <20221110112700-mutt-send-email-mst@kernel.org>
References: <20221031131934.425448-1-berrange@redhat.com>
 <Y1/SoFxe3P2HVV3W@redhat.com>
 <20221031114835-mutt-send-email-mst@kernel.org>
 <20221101135724.7f89868c@fedora> <Y2EZFXOMR7sTDJGf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2EZFXOMR7sTDJGf@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 01, 2022 at 01:03:17PM +0000, Daniel P. Berrangé wrote:
> On Tue, Nov 01, 2022 at 01:57:24PM +0100, Igor Mammedov wrote:
> > On Mon, 31 Oct 2022 11:48:58 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > 
> > > On Mon, Oct 31, 2022 at 01:50:24PM +0000, Daniel P. Berrangé wrote:
> > > > On Mon, Oct 31, 2022 at 01:19:30PM +0000, Daniel P. Berrangé wrote:  
> > > > > The TCO watchdog is unconditionally integrated into the Q35 machine
> > > > > type by default, but at the same time is unconditionally disabled
> > > > > from firing by a host config option that overrides guest OS attempts
> > > > > to enable it. People have to know to set a magic -global to make
> > > > > it non-broken  
> > > > 
> > > > Incidentally I found that originally the TCO watchdog was not
> > > > unconditionally enabled. Its exposure to the guest could be
> > > > turned on/off using
> > > > 
> > > >   -global ICH9-LPC.enable_tco=bool
> > > > 
> > > > This was implemented for machine type compat, but it also gave
> > > > apps a way to disable the watchdog functionality. Unfortunately
> > > > that ability was discarded in this series:
> > > > 
> > > >   https://lore.kernel.org/all/1453564933-29638-1-git-send-email-ehabkost@redhat.com/
> > > > 
> > > > but the 'enable_tco' property still exists in QOM, but silently
> > > > ignored.
> > > > 
> > > > Seems we should either fix the impl of 'enable_tco', or remove the
> > > > QOM property entirely, so we don't pretend it can be toggled anymore.
> > > > 
> > > > With regards,
> > > > Daniel  
> > > 
> > > i am inclined to say you are right and the fix is to fix the impl.
> > 
> > Is there need for users to disable whatchdog at all?
> > It was always present since then and no one complained, 
> > so perhaps we should ditch property instead fixing it
> > to keep it simple.
> 
> Thinking about it more, I think we should NOT fix the 'enable_tco' property,
> because there will be no way for a mgmt appp to tell if they're using a
> fixed or broken QEMU.

This is always the case for any bug. We don't as a rule add properties
for this, it is distro's responsibility to pick bugfixes for
features users care about.

What makes this bug different?


> So if they use 'enable_tco' on a broken QEMU and then
> live migrate, they'll get an guest ABI change. If we did want to support
> disabling it, then we should have a brand new property that apps can probe
> for.
> 
> In the absence of a request to disable watchdog, I'd say we just delete
> 'enable_tco' right now. If someone wants it in future, we can add it with
> a new name.
> 
> With regards,
> Daniel

I am really stressed about watchdog firing and resetting VMs that previously
were working fine. Adding this without a safety mechanism to quickly
disable in case of problems in the field is not wise imho.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


