Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08506FC4B5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 13:12:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwLEy-00043B-Jx; Tue, 09 May 2023 07:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwLEw-000427-1O
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:10:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwLEu-0004Tr-N0
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683630639;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8n3ejR7ZEYx1ENXVREQ8eXO64jUvvsGBi/xCdA7mRlU=;
 b=cuzBnhJv2YAqHx3j9pQszqdB/5/sK1q8MJZH008dbQOHwuGeLgTDLGuiQMMsnwIiHWUP6b
 t/asWZ045ynuPH2ZjxPq3zArwgQO3I7HU6ZGplIfESuJrKt3269Ckbqgo6gF/TSZkXqedv
 OQc1d4Za/Riav/vE7CE5/Hiy0P989ao=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-Nuy_9Kj_NKusnlDkdRmMvQ-1; Tue, 09 May 2023 07:10:38 -0400
X-MC-Unique: Nuy_9Kj_NKusnlDkdRmMvQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30633999815so2109774f8f.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 04:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683630637; x=1686222637;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8n3ejR7ZEYx1ENXVREQ8eXO64jUvvsGBi/xCdA7mRlU=;
 b=H0VlO73eBr6w/OVRNmzJ8b4+/hvspSEQs2I7BUkS+Xih4KCX7JQ5PIMu9AR2lj7EB6
 DloktjZkeAeoKV4zMjRLJ+UuS6yZDLYzPsz5DoFpHf/ccTLY2V/f7hq4lutQc1w5eAmv
 YvWecU0dthmjbtn/6B1pvX58QefWZh9YOgeGqcpbtzP/VVpXEi67AeHKSY+PNMkzYEjU
 QHD4FNhwwasAeQ+P3HPmxgzu6V1r97kGg7JzzCBcXvPGzXJ70xCbDOAj0iY7+5wlIQSE
 SbNnLp8FiBKIODO/bryiKtmHHyWyh5lxXEr+QQTZSh2cgtSXfkHDZgH2DKC+oYaxg/M5
 tRNw==
X-Gm-Message-State: AC+VfDxW36uwMD6f1tt28d9xJ3ZclSnTdkKtUOrGaqRq43Aws9DGAVRv
 U2+/2rs0yM1UJ5e8Q5Zum5jIomSiqcFVCHGCXkA2C3JHRlC7v3dBn0B9PmN40EeJiRoiWBCVc4K
 qjY8NHbOY3hPekw4=
X-Received: by 2002:adf:f14f:0:b0:307:86fb:dae2 with SMTP id
 y15-20020adff14f000000b0030786fbdae2mr7412482wro.67.1683630637086; 
 Tue, 09 May 2023 04:10:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5+sMJlVAI6GgGZpSF/S77rYAjfoJERqyDr3AQvkF4zsbIdc49r03VpvFSwhAhY2Lg04VQwhQ==
X-Received: by 2002:adf:f14f:0:b0:307:86fb:dae2 with SMTP id
 y15-20020adff14f000000b0030786fbdae2mr7412470wro.67.1683630636807; 
 Tue, 09 May 2023 04:10:36 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003f18b942338sm19468376wmc.3.2023.05.09.04.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 04:10:36 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  David Hildenbrand
 <david@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Eric Blake <eblake@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  John Snow
 <jsnow@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  Peter Xu
 <peterx@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,  Eric Farman
 <farman@linux.ibm.com>,  Greg Kurz <groug@kaod.org>,  qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,  Fam Zheng <fam@euphon.net>,  Thomas Huth
 <thuth@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Leonardo Bras <leobras@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 10/21] migration: Move rate_limit_max and
 rate_limit_used to migration_stats
In-Reply-To: <303c2198-c7a5-0f3c-496b-eed7b931e51a@linux.ibm.com> (Harsh
 Prateek Bora's message of "Tue, 9 May 2023 15:57:40 +0530")
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-11-quintela@redhat.com>
 <303c2198-c7a5-0f3c-496b-eed7b931e51a@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 13:10:35 +0200
Message-ID: <87lehxep5g.fsf@secure.mitica>
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

Harsh Prateek Bora <harshpb@linux.ibm.com> wrote:
> On 5/8/23 18:38, Juan Quintela wrote:
>> This way we can make them atomic and use this functions from any
>
> s/this/these
>

Fixed.

Thanks.


