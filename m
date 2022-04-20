Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56C5091A5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:52:33 +0200 (CEST)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhHJQ-0006Cp-H0
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhHIa-0005Wu-5i
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhHIX-0002Fe-Br
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 16:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650487896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TmOTvVqtNsp+dnsjrlEfSZvK3AyRtLKM0iCDaaPKUCo=;
 b=LGFv9pdSBznuy3hwnSykBH9/IgtiIMsHunSzA9XPmjW7KOFX/Z0IN1FBRhe86IORtG8sc2
 KWN19y0h4VU6+o1s+DJFrsEwPqdRZoferCSbkEZFJj00tMyzOOUnQ6QahM/Du2Kd6oBol1
 orsi74ebutrGj8hQ+YhhEhhBen7O9PM=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-s-QKF9qiOI-dpbG8OV3b0A-1; Wed, 20 Apr 2022 16:51:34 -0400
X-MC-Unique: s-QKF9qiOI-dpbG8OV3b0A-1
Received: by mail-io1-f69.google.com with SMTP id
 a17-20020a056602209100b006549a9cd480so1960705ioa.15
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TmOTvVqtNsp+dnsjrlEfSZvK3AyRtLKM0iCDaaPKUCo=;
 b=GbqqGD1p0ySdpX0ET5qQpz/2uzvD3Td8l2U4LbKVmlrIfvhUXLXG29h4rqWOR9KspM
 HtbdYojrgGO+6p3khEDMkyGTbYCaOhGbf0AYyDPBqTxID/q0Dlqz/5ZaP0guH+3hiQib
 UlGDYEnDVkRabfBl938/QGntbrzykSnOT/URaBGLbPWtPiAc11jgk3GBwZ3K4bwIJzDM
 16ts66zxZaBUbSaUCGhM/D7aUUqpUNzNcGY5VPfzuxa61vehSs/ty3M5Hk+JSOe+ybrO
 eDlquZq1DP3l02BSGDgjU6Pf7q97fxiNj8H7LimTDJD8rWh6e3MKuPxXLQGZvrFHL6AY
 D0ew==
X-Gm-Message-State: AOAM533WThZoinHXq1HOIOw6+WhVkly3kDP63RPiQd0d3tGCRc0+GX9G
 RnyqGVpny7b1Nq8gf8R9bXQZPtq6V7ZTxVka3fqn3NHyKxfSuH1rlYTrloLysxKrcv7MUHnKLA9
 BPKEX+3m7ZdSot7I=
X-Received: by 2002:a05:6638:191c:b0:326:3c70:b9c3 with SMTP id
 p28-20020a056638191c00b003263c70b9c3mr10452589jal.154.1650487894144; 
 Wed, 20 Apr 2022 13:51:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUuu+kURwFM4kv5eVDjITH1aJxupt52B6rgl7IQb4RZ4Kq5UGP5/+YTDMDPQaIerG6w7izaA==
X-Received: by 2002:a05:6638:191c:b0:326:3c70:b9c3 with SMTP id
 p28-20020a056638191c00b003263c70b9c3mr10452584jal.154.1650487893898; 
 Wed, 20 Apr 2022 13:51:33 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a924a04000000b002cd61265f68sm78553ilf.63.2022.04.20.13.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 13:51:33 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:51:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 19/19] tests: Add postcopy preempt tests
Message-ID: <YmByVGVsm2nf8D2C@xz-m1.local>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-20-peterx@redhat.com>
 <Yl/x69PnL3RkzTnz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yl/x69PnL3RkzTnz@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 12:43:39PM +0100, Daniel P. Berrangé wrote:
> >  static void test_baddest(void)
> >  {
> >      MigrateStart args = {
> > @@ -2176,6 +2219,12 @@ int main(int argc, char **argv)
> >  
> >      qtest_add_func("/migration/postcopy/unix", test_postcopy);
> >      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> > +    qtest_add_func("/migration/postcopy/preempt/unix", test_postcopy_preempt);
> > +    qtest_add_func("/migration/postcopy/preempt/recovery",
> > +                   test_postcopy_preempt_recovery);
> > +    qtest_add_func("/migration/postcopy/preempt/tls", test_postcopy_preempt_tls);
> > +    qtest_add_func("/migration/postcopy/preempt/tls+recovery",
> > +                   test_postcopy_preempt_all);
> 
> On test naming again I think we want these four tests to have names
> 
>     /migration/postcopy/preempt/plain
>     /migration/postcopy/preempt/tls/psk
>     /migration/postcopy/preempt/recovery/plain
>     /migration/postcopy/preempt/recovery/tls/psk

Well to think it again, logically if we prefer to spell out tls/psk, then
we may also want to spell out preempt/unix because of the same reason..

Similarly to all the vanilla postcopy/* tests, where if we keep tls/psk,
then we should keep postcopy/unix rather than postcopy/plain.

But let's not bother much with it.. I'll apply all the changes above in the
new version.

Thanks a lot for reviewing the series,

-- 
Peter Xu


