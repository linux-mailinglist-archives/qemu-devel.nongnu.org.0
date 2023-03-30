Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372A36D073B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:46:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsaO-00019Q-7U; Thu, 30 Mar 2023 09:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phsaM-000199-IN
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:45:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phsaK-0005dK-NG
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680183898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnYKBQsAzFXmb51+LCyvwkhoPCyx+kIjOqsPwazgt7s=;
 b=B/oH92wzKx1hUUL2yjsYLxcaFc3LOw5hvt38UPfTBjgFTH7h7lFF447UZ+6QIHDQpnHNJI
 nHcdoWBgPNivvLKRWSFL87Qo2HWQCsKWbNPOorYck+9Mm14eommMbSFNUlGEh+7Qwo3w+d
 rtNWWtNwxazfWyndODyWZk0h7Mva6gk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-uh1jRyv5N3ifqoxvQ-_A0g-1; Thu, 30 Mar 2023 09:44:56 -0400
X-MC-Unique: uh1jRyv5N3ifqoxvQ-_A0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 k1-20020a05600c1c8100b003ee6dbceb81so9853282wms.5
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680183896;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnYKBQsAzFXmb51+LCyvwkhoPCyx+kIjOqsPwazgt7s=;
 b=cpdWEELlT/MOFgDIQnFY/+iZshdLHg9upfqR4f7hGZ7tjLhVwt8gKDyg5vSjDZxpVE
 xJtNjk9Fr9YzXsSad3CRnHZtU1lADBGC6VwtXZ0kBjF/vQdBkJ3JpMEszFkQ7e0UflRW
 rYT+AvNNyt4vI6iXPhrQ70XJ7A0i47p6C4y+1Z6MXMhYBVrwYCvApqPKJfXqVgyfg+AR
 dYnEqedW2ONgKEPtlIN8J0AqXYIuhHiSUoYJqBhjMhih8BKE6Yj2caOLDpu8ZVIirDHr
 ehEf/OoEWIZyAXikDOvchiOwpCcQYYGlacCjg0LOQrzOgQGH+EA66Jymi2GIi6j76+y1
 NOtA==
X-Gm-Message-State: AAQBX9fDMWxP6UtYs78NZFaztKsEz5e89Haf9mT3yxzJB1tA7t4nK2tM
 H9IYGxuCcxg1x40/xmVK4qHVE4pgfyWtmAnsu0ef+sVKVwYxo1JHyZQhz6UMK4RlrO85/uAIM8I
 qfZ2QFKFlHp+5jkw=
X-Received: by 2002:adf:df88:0:b0:2c7:604:52a1 with SMTP id
 z8-20020adfdf88000000b002c7060452a1mr16653561wrl.29.1680183895896; 
 Thu, 30 Mar 2023 06:44:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZdyhHiXcqawBqIpv6MXSvLndn3o8nI08r+GooYp51nEpfj0BEnv1n1U3cXsCEZRN01RE4n1g==
X-Received: by 2002:adf:df88:0:b0:2c7:604:52a1 with SMTP id
 z8-20020adfdf88000000b002c7060452a1mr16653545wrl.29.1680183895523; 
 Thu, 30 Mar 2023 06:44:55 -0700 (PDT)
Received: from redhat.com ([2.52.159.107]) by smtp.gmail.com with ESMTPSA id
 s17-20020a5d4251000000b002d1801018e2sm32956870wrr.63.2023.03.30.06.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 06:44:55 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:44:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Eric DeVolder <eric.devolder@oracle.com>, shannon.zhaosl@gmail.com,
 imammedo@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Message-ID: <20230330094323-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
 <20230329124442-mutt-send-email-mst@kernel.org>
 <68579d53-cbb5-154a-6c1e-e733f16540@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68579d53-cbb5-154a-6c1e-e733f16540@anisinha.ca>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Mar 30, 2023 at 01:06:36PM +0530, Ani Sinha wrote:
> 
> 
> On Wed, 29 Mar 2023, Michael S. Tsirkin wrote:
> 
> > On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
> > >
> > >
> > > On 3/29/23 00:19, Michael S. Tsirkin wrote:
> > > > Hmm I don't think we can reasonably make such a change for 8.0.
> > > > Seems too risky.
> > > > Also, I feel we want to have an internal (with "x-" prefix") flag to
> > > > revert to old behaviour, in case of breakage on some guests.  and maybe
> > > > we want to keep old revision for old machine types.
> > > Ok, what option name, for keeping old behavior, would you like?
> >
> > Don't much care. x-madt-rev?
> >
> > > >
> > > >
> > > > On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
> > > > > The following Linux kernel change broke CPU hotplug for MADT revision
> > > > > less than 5.
> > > > >
> > > > >   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> > > >
> > > > Presumably it's being fixed? Link to discussion? Patch fixing that in
> > > > Linux?
> > >
> > > https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> >
> > Great! Maybe stick a Link: tag in the commit log.
> 
> If the original bug is in the kernel and kernel upstream has accepted both
> your fix and Mario's patch on the acpi revision mess, I see no urgency to
> fix this in QEMU.
> 
> Maybe we can address this in the 8.1 development window.

Why "maybe"? Eric is working on a patch I don't see why we won't
address it.

-- 
MST


