Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542CD58FA2A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 11:38:11 +0200 (CEST)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM4dm-0001Kq-Fb
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 05:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM4X6-0005E6-FJ
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:31:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM4Wz-00074N-M1
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660210269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mit6mv093n1kWWIu6xmZI6IixPsGbc06bLj4k1K5snI=;
 b=A+2uJZBgy/lxtR1exon+IAgQb0kPf761D5X29F1MDhExRApsMJWwKavNzwXBD18dw+wZmd
 6eVC/4gl0u9nSvr53lMt0sl67myyypu0vmeTcHwcriePT9xAC/PiiOj6+NOq4Pfe1YkzuJ
 HDKrMp4a7rUwD6uipK5rpDw3IQRzUfo=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-JbdiavRuMH2F-sTux3_mug-1; Thu, 11 Aug 2022 05:31:07 -0400
X-MC-Unique: JbdiavRuMH2F-sTux3_mug-1
Received: by mail-ua1-f69.google.com with SMTP id
 z44-20020a9f372f000000b00390af225beaso210959uad.12
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 02:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=Mit6mv093n1kWWIu6xmZI6IixPsGbc06bLj4k1K5snI=;
 b=DVoYCuQqh15iVmn+2BgjBwot3aHMnypmosuBCC5Gvy3aRUo+oDvNOd9ybshnhUxwYY
 KTInfiKZg03SLKY3nenqmTQW/4vzzDdLtaoLGvzp3g0k+ed7acz+Xf+4vse2dOqDM3NX
 Z2RgHeRP2MYAViNqPBV6cSdO62ZPSvMSAQp3s61jJEbLN5gTM/TvtTUdf+Yjs9e/bzXe
 Ml+xNCuXCCeASc9lER0oz+Dng9Z404ntu4+fTLwKtsTjxiw83BnHfNKbOEWBTDJG5hvQ
 xFLyrZ0Zd5DNxHT9rnC5yAIIP4GruXCzY33Tg93K4WOOT/JEm9OmtFO0qHI0FekuMzOZ
 8aSQ==
X-Gm-Message-State: ACgBeo1yF00lO6W7wcdTBdSgZGsjp0xWbIuWUQyAOYPawnkxV4m9zT/p
 BnCNhJr1SAaoc9z8atayUtXygl67R/lyFkVF2Gloz1rgRpr89CFyuOZ2TVEDtK3OC0gvYYuqr1A
 El08Lzmzyh18yuvM=
X-Received: by 2002:a05:6102:ec7:b0:388:d2a2:41c5 with SMTP id
 m7-20020a0561020ec700b00388d2a241c5mr5694916vst.41.1660210267430; 
 Thu, 11 Aug 2022 02:31:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7I0k3lkwB3s5FaBzBoKhhZ5ZggpHft+AfPz56J3K+sCj8R+ess8hsmNQxQRxYv4D47yCsXSw==
X-Received: by 2002:a05:6102:ec7:b0:388:d2a2:41c5 with SMTP id
 m7-20020a0561020ec700b00388d2a241c5mr5694902vst.41.1660210267208; 
 Thu, 11 Aug 2022 02:31:07 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a800:5713:6880:fd74:a3e5:2086?
 ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 t10-20020ac5c96a000000b003777ef1ec70sm1540689vkm.7.2022.08.11.02.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 02:31:06 -0700 (PDT)
Message-ID: <5e04e871ba9b06c2fe866b2da3cab872a267eb92.camel@redhat.com>
Subject: Re: [PATCH v7 09/12] migration: Export ram_release_page()
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Thu, 11 Aug 2022 06:31:03 -0300
In-Reply-To: <20220802063907.18882-10-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-10-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.h | 1 +
>  migration/ram.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/migration/ram.h b/migration/ram.h
> index e844966f69..038d52f49f 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -66,6 +66,7 @@ int ram_load_postcopy(QEMUFile *f, int channel);
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
> =20
>  void ram_transferred_add(uint64_t bytes);
> +void ram_release_page(const char *rbname, uint64_t offset);
> =20
>  int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
>  bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_o=
ffset);
> diff --git a/migration/ram.c b/migration/ram.c
> index 499d9b2a90..291ba5c0ed 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1238,7 +1238,7 @@ static void migration_bitmap_sync_precopy(RAMState =
*rs)
>      }
>  }
> =20
> -static void ram_release_page(const char *rbname, uint64_t offset)
> +void ram_release_page(const char *rbname, uint64_t offset)
>  {
>      if (!migrate_release_ram() || !migration_in_postcopy()) {
>          return;

LGTM. FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>


