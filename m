Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC886F5979
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:01:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puD2j-0001pE-C8; Wed, 03 May 2023 10:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puD2i-0001oW-19
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puD2g-00036b-Ik
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683122474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OXZrPtXZXhEbL3yxkvFIiyM+LYhHP6wzbyEDthuCYOQ=;
 b=LLywQ7dhfn9aDXBvXdJYySqiJyMnFhk6Pn+ja9i+nMJI33fxhQXrIwsk29ThOI0+SAiXsS
 pCSE8hC09UVUIwMuz/lyqEXlk3jmJQ77svcq20q7voG7M/N9xyhYU+72oHV8AJX3faSI9d
 aKtEvGbodjVTpo1BR6bddFC1lqhEbgs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-Yhn7FHVOPS-R5bzHZaLhrw-1; Wed, 03 May 2023 10:01:12 -0400
X-MC-Unique: Yhn7FHVOPS-R5bzHZaLhrw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f16f50aeb5so17788745e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 07:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683122470; x=1685714470;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OXZrPtXZXhEbL3yxkvFIiyM+LYhHP6wzbyEDthuCYOQ=;
 b=Fd3Gk/XCxkY9rzqaHfXWFUwbUI9P/3cJf62rgiyabzIIxoa+M4toJnmByp28i/vBaK
 L9QsWYgQ+ZJBS2GNYUFdGbB8Fl2xdNCXw5Xox7Xy1HmNf9Waz/7eud/m1iNA5ceAO/L3
 MIpt6k8Sa11PQqOf80eL17Tni645tZdS5o0sCPjnlIT5+vXJSrABNLVTF//kQaqRTczc
 EjtMOItGMIQF20o/pT1zBAGudihwWyQ8x+O92zWcNTU+L2BhAWWuHjVBTm5ARgjrirQI
 7yQGS3LGUYi2iHIgz55i7w5acEiaoSq21oYFwF9jaQ8lGA5o0794QZXZ9jjd9mYREOg7
 zqmA==
X-Gm-Message-State: AC+VfDyGKiuZvvaOy6+ou6FmQgVaEOuhYnSzilWS1QyUSZcuozuwnviL
 UY1f8XGpFuQPGpERSK5U41/7STl+mI/C2yEMhIAH56+atDuKctb+NK3hAcG9j1X4GSpYR9ZtCM0
 FdYbHl30WrxIJaaQ=
X-Received: by 2002:adf:cd90:0:b0:306:37a2:6e56 with SMTP id
 q16-20020adfcd90000000b0030637a26e56mr183258wrj.5.1683122470601; 
 Wed, 03 May 2023 07:01:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TiTXnJ/KuruRp1cDt07emEaomUZyeytThgn0N7hCrZ5TXGBZJHruhJEPEgeYr+48JJ6gHMg==
X-Received: by 2002:adf:cd90:0:b0:306:37a2:6e56 with SMTP id
 q16-20020adfcd90000000b0030637a26e56mr183236wrj.5.1683122470321; 
 Wed, 03 May 2023 07:01:10 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 p17-20020a056000019100b002fda1b12a0bsm34080123wrx.2.2023.05.03.07.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 07:01:09 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH v2 01/16] migration: Create migrate_rdma()
In-Reply-To: <ZFJi0/K2BXhYkh75@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 3 May 2023 14:34:11 +0100")
References: <20230503131847.11603-1-quintela@redhat.com>
 <20230503131847.11603-2-quintela@redhat.com>
 <ZFJi0/K2BXhYkh75@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 16:01:08 +0200
Message-ID: <87o7n1qztn.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Wed, May 03, 2023 at 03:18:32PM +0200, Juan Quintela wrote:
>> Helper to say if we are doing a migration over rdma.
>
> Is the "MigrationState" allocated freshly for every incoming
> or outgoing migration ?  If it is reused, then something
> needs to set 's->rdma_migration =3D false' in non-RDMA code
> paths.

for (i =3D 0; i < 1000; i++)
    printf("never trust memory, check the code.\n");

You are right, the function that we call is:
migrate_init()

but we clear each statistic by hand, not a memset().

And now I have to review that we are not missing any other field to
reset.

Thanks, Juan.


