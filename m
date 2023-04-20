Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF5F6E8EB7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:56:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppR1I-0003sW-72; Thu, 20 Apr 2023 05:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppR1G-0003rp-Uk
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppR1F-0001OE-Ke
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681984561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fEj1bMF2urdmmAPppsr/439Odr9qyKc856nlfczHOCM=;
 b=hnqTygMYUt/KdS4o8ZVrAzx+w/L+M6KnoGOXF2Os6L5WL1X8ZBK06RbYyik5yzgL86G1ci
 OyUoIwclY7lekEKH9zqz05I6/mD/sAHCgEFb/eBW3PIQSV5SZ0a/zcyBtWmnANnfFrpyMs
 T5T4Nt4U3BYfih073VBy2Jx9mI23kCM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-AombxQdtN46kzHCuZNLmIw-1; Thu, 20 Apr 2023 05:55:59 -0400
X-MC-Unique: AombxQdtN46kzHCuZNLmIw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2ffa43cd733so279584f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681984558; x=1684576558;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEj1bMF2urdmmAPppsr/439Odr9qyKc856nlfczHOCM=;
 b=QEC4jKKd/zbUo1ttm+xfvp/j1+RPB011BLFisAl39WcQhOjv1O2CulXzJaKTCZ2ro1
 dpfiduLj50qLrb5LZObyV0k0JEglavFM0kyB66QSPQlvg+Fc1Vqnj2PKZLgcnozf5+yx
 z6CGI2mQceGOJLHiuirDUABYGPtbxSTJC88xcFqZ1j9dVspPtKf5x2/c4u5SRfX/d5EQ
 FGn1/Psn9XZ0kiYGMS1sGjCOcXVBFQRXCuSN36MJtnDSj0g19/ydeePGR3Y9lqLqPuu3
 euHolp+LSn0D+R7Z6G5elLTuJBY89G26tIGeiy+eOeeMUZF7KLt3U66c6TYT5TTW/SHc
 xTzA==
X-Gm-Message-State: AAQBX9eocJJ7Dz1oSmjvAr8U2BeFFsKFdSXRrNi/KYmym176PNCTwXEE
 SqFze2gNGMfj6cOtg+Nw/En1ITbal9C9ui+CmYQMx0/VFHWRX8rEPJmt/jZZWSeIDVjG/iE4aqp
 c/FbgyFAkUFZn0uk=
X-Received: by 2002:a5d:4012:0:b0:2f8:81c1:ea75 with SMTP id
 n18-20020a5d4012000000b002f881c1ea75mr792062wrp.20.1681984558386; 
 Thu, 20 Apr 2023 02:55:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZHfeChm8YNwiF73HSsK6BKSTd8x+8CbhCF6PQXFyDrGj1Dzy8vWoCvu3vnlLc5wns2aga0gw==
X-Received: by 2002:a5d:4012:0:b0:2f8:81c1:ea75 with SMTP id
 n18-20020a5d4012000000b002f881c1ea75mr792039wrp.20.1681984558129; 
 Thu, 20 Apr 2023 02:55:58 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm1560877wrv.11.2023.04.20.02.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:55:57 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  michael.roth@amd.com,
 armbru@redhat.com,  eblake@redhat.com,  jasowang@redhat.com,
 zhanghailiang@xfusion.com,  philmd@linaro.org,  thuth@redhat.com,
 berrange@redhat.com,  marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 dave@treblig.org,  hreitz@redhat.com,  kwolf@redhat.com,
 chen.zhang@intel.com,  lizhijian@fujitsu.com
Subject: Re: [PATCH v2 2/4] scripts/qapi: allow optional experimental enum
 values
In-Reply-To: <20230419225232.508121-3-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 20 Apr 2023 01:52:30 +0300")
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-3-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 11:55:56 +0200
Message-ID: <87leimzxlf.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> To be used in the next commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

I am cc'd, but this is black magic to me.

Later, Juan.


