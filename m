Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE29456EC4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 13:23:03 +0100 (CET)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo2uz-0003FS-Vn
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 07:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo2tc-0002V8-2I
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:21:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mo2tY-0000SD-FK
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 07:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637324491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hzTz+5JYzzIiZGXzTipIOarM9LyND78JA1T2fX3Q7aA=;
 b=W+AnoChLXSZIamnE7SfXr7t8ye84g54slGw4DOgIhRoWofrQXTRTryc/oRwV0yzHKdVtsT
 mTX8J+v7mM7wXhTRmscZadULJsCIDToGzOp+tN6cDyoeKLcd5pRSoztyYNPpMkZ3flwLVb
 Gavt9blcBqwYFoob6Ae5L22raAVUeOs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-7GVmwIMONMmBA_61ZCyE0A-1; Fri, 19 Nov 2021 07:21:29 -0500
X-MC-Unique: 7GVmwIMONMmBA_61ZCyE0A-1
Received: by mail-pj1-f69.google.com with SMTP id
 mn13-20020a17090b188d00b001a64f277c1eso6623198pjb.2
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 04:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hzTz+5JYzzIiZGXzTipIOarM9LyND78JA1T2fX3Q7aA=;
 b=6OZ2ScL084U/sJyFvJfJ/aabi6kMIUYv6tWclidLTuQ5p1L1CjJVt1cLathVNdNPbC
 qrisq2U3JKceVv1GicvbxBHEyqwCdeAz6F5Q/wgtEI8F2TS1gu01GvyegCZ5o98Klyk8
 ndwboubbvzU7fq2loq+zS65nHPQRiAd3nqlaAOq9jHnkcbViwrV3huIDOJO9irxHCNg7
 vR1lVffpBBb6V3P0zj8whF98WCfr2b7blsn0KMgn5OlShi7Lb35pEmFbL7dWhupzAnaT
 TwB+V0FHfxFGodyejObgTO4JLAEwSUHijEcR/bB0V2usVAdWnNHZwiPdGzHwZfi4c6xz
 Azkw==
X-Gm-Message-State: AOAM533TUDgIN0IgTDgVs1t453u1H/C1LXurqH8AbA2RBgHLX5YYUNBZ
 bbXpV1OEsCWxITSqJ8bKIE/wAMv+ER+KU02bO6L3cO0FuD/ktb3iRPi3gPepl9nwhQ71+hveLgk
 kniv+1Q3/KYtjwqxmDCMi/PaTpdAkbFE=
X-Received: by 2002:a17:902:c3cc:b0:141:be17:405e with SMTP id
 j12-20020a170902c3cc00b00141be17405emr76967154plj.76.1637324488667; 
 Fri, 19 Nov 2021 04:21:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSPcIBgCtbhHj68RCu56uZhLFb1IGstXc+oVj+PmWD1XlZa23XSE4oo91JVPOaUYLUqqYRMeYRQ6ZlgrjnKxc=
X-Received: by 2002:a17:902:c3cc:b0:141:be17:405e with SMTP id
 j12-20020a170902c3cc00b00141be17405emr76967119plj.76.1637324488415; Fri, 19
 Nov 2021 04:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20211118204620.1897674-1-jsnow@redhat.com>
 <20211118204620.1897674-2-jsnow@redhat.com>
In-Reply-To: <20211118204620.1897674-2-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 19 Nov 2021 09:21:02 -0300
Message-ID: <CAKJDGDY9fxXLknx7QMn1vxVGNzK-oDgFQPOO2iDkS-7C2_bz7A@mail.gmail.com>
Subject: Re: [PATCH 1/7] python/machine: add @sock_dir property
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 5:50 PM John Snow <jsnow@redhat.com> wrote:
>
> Analogous to temp_dir and log_dir, add a sock_dir property that defaults
> to @temp_dir -- instead of base_temp_dir -- when the user hasn't
> overridden the sock dir value in the initializer.
>
> This gives us a much more unique directory to put sockfiles in by default.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


