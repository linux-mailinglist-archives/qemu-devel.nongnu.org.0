Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9C24D8BBC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:22:25 +0100 (CET)
Received: from localhost ([::1]:56152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpKr-0001sq-1Q
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:22:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nTpJa-00010r-Rk
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nTpJW-0006fH-9G
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647282060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ubkNFQ2/56JjruDQ+/cKbqaISPOhsp0oOo+iOBIyxpA=;
 b=FD7TkzeP5EZzBeAmtC5LpZZOrD83JTzuBiHAb2zFvw2oH/cHS8181MTP+Ihjl85PMH0NVK
 TvH7ctWxPBa4gp+Mrnnm9MEgIax2rzgjvEYSvw160EhxiyTBMpdJhjmrEtHQ9AaQOo0pBS
 5rtm47KBjiig1WyaUJmcSUVgl4JbBmw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-bd6TKiNvPu2lIEVW3pc4ZQ-1; Mon, 14 Mar 2022 14:20:59 -0400
X-MC-Unique: bd6TKiNvPu2lIEVW3pc4ZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 20-20020a05600c231400b00389886f6b23so18266wmo.6
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 11:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ubkNFQ2/56JjruDQ+/cKbqaISPOhsp0oOo+iOBIyxpA=;
 b=pRUnsy9h3zUwXUJjElnKw20EyiPMaUZfvxquZICblgosLwvFnMNUuTCTimozD7Zffd
 lgtlUh7aKFAS//6Qg/kTo7qs95dthVPwFYYNQ1FwpiaYOIpd/y2CBgB0gwcB+TQZL/8K
 gaep61EsA/f/FzRwf5NU+6KEx+VoiZqqqA7o1jQ7DZuXsCEnKY5w9wVCeTtpHZFniOKz
 99Trbh/+Khl3JR7TifAHyVq8iP7b+fbsXG0MPL9gMkfnbo28uCVZ/jyY6wcJ+Iz99O8j
 4x96veRSC7RnDaYlp/bMESwQ2m2b4eFS8r7wmLp2hfPhfAoWgBEZsaG7BSSsEe8s8ZRA
 HU6A==
X-Gm-Message-State: AOAM530XoYfmdgYnKZAcAIbP2t+JlV6BjCBmeZK4tQZEkPM4apOHdKDh
 7xI7tujDOEzFRuCZblZ2040cVel3lWJaQOrvBaifH7hGpMX38ejwWt2Ys7QijiH4mBUe+fdL0af
 /BWOxQgaDvWOZbz4=
X-Received: by 2002:adf:d216:0:b0:1f1:eba8:a2ff with SMTP id
 j22-20020adfd216000000b001f1eba8a2ffmr17448258wrh.644.1647282057981; 
 Mon, 14 Mar 2022 11:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR9oUejn9gQC7nQYJUc2sYad7ec26tVhYF4mVA75piptniy2gED6JkHx5mA9fxSrZAxkaldg==
X-Received: by 2002:adf:d216:0:b0:1f1:eba8:a2ff with SMTP id
 j22-20020adfd216000000b001f1eba8a2ffmr17448239wrh.644.1647282057790; 
 Mon, 14 Mar 2022 11:20:57 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u4-20020adfed44000000b0020373d356f8sm13848921wro.84.2022.03.14.11.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 11:20:57 -0700 (PDT)
Date: Mon, 14 Mar 2022 18:20:54 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/18] migration queue
Message-ID: <Yi+HhvvlurQdW/Oq@work-vm>
References: <20220302182936.227719-1-dgilbert@redhat.com>
 <CAFEAcA9CrHEu8F7PGGTvsdyLnFJhan9V9FkHDgvapje+_E=hVA@mail.gmail.com>
 <f750a1a4-223c-9456-ab23-a616f7eb2625@gmail.com>
 <Yieku+cTxY0Xyp5C@work-vm>
 <CAFEAcA-Y_8KTxCPoSN3P0Cgfe6cEN74b-5U1SeKtAP7FdzFvZA@mail.gmail.com>
 <Yi92SN2Z3OZi82pS@redhat.com>
 <CAFEAcA-Chg3LQkh5PHmSyGCkmnYoPnTGMD=zm8jj-jxWeOLTxQ@mail.gmail.com>
 <Yi+BbRJ9lbJ4ku9L@work-vm>
 <CAFEAcA_z2M2_MyWXT7iUKAFzpj1vWsw0DPV7o4YHp2d-1scf9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_z2M2_MyWXT7iUKAFzpj1vWsw0DPV7o4YHp2d-1scf9g@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: thuth@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, s.reiter@proxmox.com, qemu-devel@nongnu.org,
 peterx@redhat.com, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philippe.mathieu.daude@gmail.com>,
 hreitz@redhat.com, f.ebner@proxmox.com, jinpu.wang@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 14 Mar 2022 at 17:55, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > Peter Maydell (peter.maydell@linaro.org) wrote:
> > > One thing that makes this bug investigation trickier, incidentally,
> > > is that the migration-test code seems to depend on userfaultfd.
> > > That means you can't run it under 'rr'.
> >
> > That should only be the postcopy tests; the others shouldn't use that.
> 
> tests/qtest/migration-test.c:main() exits immediately without adding
> any of the test cases if ufd_version_check() fails, so no userfaultfd
> means no tests run at all, currently.

Ouch! I could swear we had a fix for that.

Anyway, it would be really good to see what migrate-query was returning;
if it's stuck in running or cancelling then it's a problem with multifd
that needs to learn to let go if someone is trying to cancel.
If it's failed or similar then the test needs fixing to not lockup.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


