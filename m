Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCA16E8EA2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:52:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQx9-0000wG-Ii; Thu, 20 Apr 2023 05:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppQx7-0000w7-Uf
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppQx2-0000N8-0K
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681984298;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UTp4eZ1ZMYdgYkkW/ElRXTvd2cy0pfJHKKhAwbE9SJU=;
 b=fRi3L8krmeGhlQTwCF/kv8wu4Jpt8GvYjMXGnmOEFLdqjYMOii85b9pZ5r4dgjGCNy4Qm1
 onc3omYli6RF5y6wlQl7xs4VUtFVHMAX5Gnu9t8PkVmhzmnhXAnW9VT8hgxQ2qkfsh96GH
 HTOOu5Sh+wQKflyey/81oXMFueBaMPI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-kMzyht9oMnyQp6KeoPWYXA-1; Thu, 20 Apr 2023 05:51:37 -0400
X-MC-Unique: kMzyht9oMnyQp6KeoPWYXA-1
Received: by mail-wm1-f72.google.com with SMTP id
 hg24-20020a05600c539800b003f066c0b044so1951297wmb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681984296; x=1684576296;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UTp4eZ1ZMYdgYkkW/ElRXTvd2cy0pfJHKKhAwbE9SJU=;
 b=E6qFMnuyaQAlSy6lhCp2skDUaTrki9Yhhq5bYM/1UJYX+uGpqkni5nmtFwFRRYAIP3
 WEDvU93jq0/EFvhixvQEiy2qv+mN3TSzD1hbPAvpDLwtvcoB2Pi6hwu+GPT3JP6DxF/s
 oiOD5ImYZzha6Yg98yurp+RBj+8RC/BZwBzcUlty7dGbE2RnHqSoY+fVFDmpgf/SfwaA
 vf3mdUcWUzsnAS+6s73eSMElI1ZiK5CmO1eNsfXJGgOY4JF6V801s1rK/45GHCYljyXc
 fEAKTnhYMMVOvkJxd3ti2jetPINQecdQg9f2cjnkd61C9C/bGzJ4nRT6I9b2p4YJgr3H
 c6Lw==
X-Gm-Message-State: AAQBX9e42W1qc0uQp+x9VoY3C5gmoBvcL+8n11b9kQ2KMCSNZ4uP4kQf
 BaJ5eFxZrUSr9Hoaf6a2cnqVAZOFHTmeRebwk8nxO7ZKCNf5XyBNACl3wRrVBbPfOCiDmyliDx9
 Xmag1Phb08xjvSjk=
X-Received: by 2002:a7b:c388:0:b0:3f1:6fea:790a with SMTP id
 s8-20020a7bc388000000b003f16fea790amr801737wmj.30.1681984296076; 
 Thu, 20 Apr 2023 02:51:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350arwhlAYQYk31Qw1Jx+smmHS0APSbuHtb3ghv9KNT30ZgAN5DxLJQndxBMG3sHStFW4I9vTvA==
X-Received: by 2002:a7b:c388:0:b0:3f1:6fea:790a with SMTP id
 s8-20020a7bc388000000b003f16fea790amr801725wmj.30.1681984295770; 
 Thu, 20 Apr 2023 02:51:35 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 14-20020a05600c028e00b003f18b942338sm1186267wmk.3.2023.04.20.02.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:51:35 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  michael.roth@amd.com,
 armbru@redhat.com,  eblake@redhat.com,  jasowang@redhat.com,
 zhanghailiang@xfusion.com,  philmd@linaro.org,  thuth@redhat.com,
 berrange@redhat.com,  marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 dave@treblig.org,  hreitz@redhat.com,  kwolf@redhat.com,
 chen.zhang@intel.com,  lizhijian@fujitsu.com
Subject: Re: [PATCH v2 1/4] block/meson.build: prefer positive condition for
 replication
In-Reply-To: <20230419225232.508121-2-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 20 Apr 2023 01:52:29 +0300")
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-2-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 11:51:34 +0200
Message-ID: <87pm7yzxsp.fsf@secure.mitica>
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
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


Reviewed-by: Juan Quintela <quintela@redhat.com>

> ---
>  block/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/meson.build b/block/meson.build
> index 382bec0e7d..b9a72e219b 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -84,7 +84,7 @@ block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c')
>  block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
>  block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
>  block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c'))
> -if not get_option('replication').disabled()
> +if get_option('replication').allowed()
>    block_ss.add(files('replication.c'))
>  endif
>  block_ss.add(when: libaio, if_true: files('linux-aio.c'))


