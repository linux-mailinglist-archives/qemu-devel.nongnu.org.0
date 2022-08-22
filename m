Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F401359C575
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:52:55 +0200 (CEST)
Received: from localhost ([::1]:50110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBba-0006uf-Qc
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQ9Pp-0005cv-Fw
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQ9Pm-0001qQ-EA
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:32:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661182345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VA2IGAlBvzhwXy5zuH6/N1Gi0n/LSl+fkDKeNTqjmgM=;
 b=I2PNi8+f/cyp3OiIQQrNQ2Usxs1R54NGUruRWmn04jJEzT1/CrNzgKI9Nc+tXTUMONARGC
 5iUfTGC/zlLoyDU8z3v4XD6JOp6Cu9r2HX2YJ99gU2OmfSMs4+D7TCh5whK7N/NZMXw3sg
 szIPxBea3/gfOJ3OPcl3qzjHTj4POS4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-RIkpO3v5PT6Ozru_5nHWDQ-1; Mon, 22 Aug 2022 11:32:24 -0400
X-MC-Unique: RIkpO3v5PT6Ozru_5nHWDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 f7-20020a1c6a07000000b003a60ede816cso2070742wmc.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc;
 bh=VA2IGAlBvzhwXy5zuH6/N1Gi0n/LSl+fkDKeNTqjmgM=;
 b=w4RKCwsrdcq8hT2gMVmweazc0dL5W/9Gc1XXwo6T4DlJe3opA/q9GJT1vmvXttDPu7
 wQwsmNxFjwyFJ7M7BTdNVvJFLlD09IggZV92YPEBBEPE6WnLxQDUiuffNtN7NC9aXQWD
 agUpQRx4dJSrUi4ArcY+k0i/Qz/1HbUAV571QV+HFRt18JOzbNO1bEq60wwsSMFnrJH7
 jvaf2kxhHfdtWC6jw8uPIgD1Gw/qC5abj50NbMd5c8XS4EkZFHIzsOAKRAYX61J5LTRe
 mSP2q15BHI5NKZWwxNS0WSfUxrXl6ZH9iz/HdJdtfBVTWXa7B/lWKMW4BcbAfgoNCqWE
 6mTA==
X-Gm-Message-State: ACgBeo07XbfPqUSEMDdqNIudI2pqbiriLcO09lMS5W4/D+vHpVV71pny
 ezYVvMOje9yrm+hxd5/cAYkyV21xGVk5cSHPrDSxqjQgK9eIHJgSKSCSwXJSikIlo+9Vx4P6Y9+
 x4KPT68oBtDLh9mU=
X-Received: by 2002:a5d:64a6:0:b0:21f:b3b:5cc9 with SMTP id
 m6-20020a5d64a6000000b0021f0b3b5cc9mr10540267wrp.601.1661182343225; 
 Mon, 22 Aug 2022 08:32:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6N8uqpKlqERhhly5YKPpmAHPmfpX4MYRQCMkuf6ugVgKliiogj2WD3wSOcPUqZq0sbZ39tdA==
X-Received: by 2002:a5d:64a6:0:b0:21f:b3b:5cc9 with SMTP id
 m6-20020a5d64a6000000b0021f0b3b5cc9mr10540251wrp.601.1661182343016; 
 Mon, 22 Aug 2022 08:32:23 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q4-20020a1c4304000000b003a5c7a942edsm17750434wma.28.2022.08.22.08.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:32:22 -0700 (PDT)
Date: Mon, 22 Aug 2022 16:32:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 4/4] tests/qtest/migration-test: Remove duplicated
 test_postcopy from the test plan
Message-ID: <YwOhhAlaqsDIp7ZM@work-vm>
References: <20220819053802.296584-1-thuth@redhat.com>
 <20220819053802.296584-5-thuth@redhat.com>
 <YwNhhsWk9Gsn6A1e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YwNhhsWk9Gsn6A1e@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Fri, Aug 19, 2022 at 07:38:02AM +0200, Thomas Huth wrote:
> > test_postcopy() is currently run twice - which is just a waste of resources
> > and time. The commit d1a27b169b2d that introduced the duplicate talked about
> > renaming the "postcopy/unix" test, but apparently it forgot to remove the
> > old entry. Let's do that now.
> 
> It was probably a merge error

Yeh I remember having to do a lot of manual merges around htere.

Dave

> > 
> > Fixes: d1a27b169b ("tests: Add postcopy tls migration test")
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  tests/qtest/migration-test.c | 1 -
> >  1 file changed, 1 deletion(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


