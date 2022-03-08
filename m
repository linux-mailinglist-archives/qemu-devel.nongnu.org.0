Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A404D208B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:50:26 +0100 (CET)
Received: from localhost ([::1]:42246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReue-0005YU-IY
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:50:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRerw-0004nH-FB
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:47:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRers-0007yr-TR
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646765250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSfTWXKngkxfiEbI5GB5HK8yYrgocptv0FjgXX9U8UI=;
 b=LFzpmBVos9ZbVBp1irQ7LS+2VoLoVpLvyc09hfL60NHqLCooHSMrj+ScnjhtaXMzoh7rjG
 aXSwaypn3A1U4nEC03p+adaJWIx0WkV0AjvznNGU+a+DjRO3gtYMzf0C/I/gZWz+Yi5wzO
 WRFW/LjRF6ObG+iOToV2TMav9d6DwGw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-T5JoOHBrOI-XlVRyR0L22g-1; Tue, 08 Mar 2022 13:47:28 -0500
X-MC-Unique: T5JoOHBrOI-XlVRyR0L22g-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfec81000000b001f1f7e7ec99so1794999wrn.17
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FSfTWXKngkxfiEbI5GB5HK8yYrgocptv0FjgXX9U8UI=;
 b=kZOfjbPwAXKD4liLFbzr+EPE/0eR/IvefrQtGU9v4d6613nVwZMocwdWPjlcQctwge
 DCX6JvNg+/CD3nkhxHp4w1fMigb4ZDeUYSnNCnVnDSDtF0snb+qj9NekpUdKgR8uMINb
 TkaBX0/ztJ8R7LY2psfMP4d9RY7dAY8FVfG4JYRkPUlsq8GlvjiGIXTaAncaDPDAstSa
 xhKHP4Q4RpUUD6+eoPYv32a9RcoMRAKW77pz1K6yFbBWYETUNnH3pIf7LbaLGjJZ6ykV
 U1+zCw5YhG35RTfWKkD7UPQQgbFvcmwsV3EzZ7FAykwQsxnp7v0KGMau0zqCFK7wNdJ/
 ra7A==
X-Gm-Message-State: AOAM533UZ+NMT4FjwaqORDdyN3jYKk7ZdshpFHahnxip5B1y5CBFF+sn
 mSFJj9AMHuhqNEkVUzXVCOKiQQflXtysFhpDhHfZNaZSL+1jxTosr3rPEi6PlAix2YlgXvgwpPf
 sqr9OEFR4fHWCN4o=
X-Received: by 2002:a05:600c:268a:b0:389:9d61:420 with SMTP id
 10-20020a05600c268a00b003899d610420mr4815208wmt.122.1646765247223; 
 Tue, 08 Mar 2022 10:47:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrX75TaMbo/SbEa+wjJ89FixUPPByhX6NctYi5qq1RQQLqrhJBT/iOTim9sdcopbwNqG8thg==
X-Received: by 2002:a05:600c:268a:b0:389:9d61:420 with SMTP id
 10-20020a05600c268a00b003899d610420mr4815178wmt.122.1646765246851; 
 Tue, 08 Mar 2022 10:47:26 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f2-20020a056000128200b001f1f39d05b0sm6516182wrx.100.2022.03.08.10.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:47:26 -0800 (PST)
Date: Tue, 8 Mar 2022 18:47:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, thuth@redhat.com
Subject: Re: [PULL 00/18] migration queue
Message-ID: <Yieku+cTxY0Xyp5C@work-vm>
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 s.reiter@proxmox.com, qemu-devel@nongnu.org, peterx@redhat.com,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>, hreitz@redhat.com,
 f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (philippe.mathieu.daude@gmail.com) wrote:
> On 3/3/22 15:46, Peter Maydell wrote:
> > On Wed, 2 Mar 2022 at 18:32, Dr. David Alan Gilbert (git)
> > <dgilbert@redhat.com> wrote:
> > > 
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47b1:
> > > 
> > >    Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' into staging (2022-03-02 12:38:46 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220302b
> > > 
> > > for you to fetch changes up to 18621987027b1800f315fb9e29967e7b5398ef6f:
> > > 
> > >    migration: Remove load_state_old and minimum_version_id_old (2022-03-02 18:20:45 +0000)
> > > 
> > > ----------------------------------------------------------------
> > > Migration/HMP/Virtio pull 2022-03-02
> > > 
> > > A bit of a mix this time:
> > >    * Minor fixes from myself, Hanna, and Jack
> > >    * VNC password rework by Stefan and Fabian
> > >    * Postcopy changes from Peter X that are
> > >      the start of a larger series to come
> > >    * Removing the prehistoic load_state_old
> > >      code from Peter M
> 
> I'm seeing an error on the s390x runner:
> 
> ▶  26/547 ERROR:../tests/qtest/migration-test.c:276:check_guests_ram:
> assertion failed: (bad == 0) ERROR
> 
>  26/547 qemu:qtest+qtest-i386 / qtest-i386/migration-test            ERROR
> 78.87s   killed by signal 6 SIGABRT
> 
> https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/562515884#L7848

Yeh, thuth mentioned that, it seems to only be s390 which is odd.
I'm not seeing anything obviously architecture dependent in that set, or
for that matter that plays with the ram migration stream much.
Is this reliable enough that someone with a tame s390 could bisect?

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


