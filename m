Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E1D6FDA42
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:00:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwfgR-00057r-Tg; Wed, 10 May 2023 05:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfgN-00056r-OC
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:00:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwfgM-0005e5-AG
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683709221;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+l00LP9nvQjDKaf7hL/2agM7QmmdtBjvbD16d70YE4=;
 b=Ii+ledyz+1/sAQPH78VRbgwiN77QHbPleC26Ap0pNgEECZtBJXWrpEuVkDiycJd9AOT0vS
 rEZitPHhtYDAjD/cEDCsdO1CAVUKLniuOIbnr6F1kMf+qW6Xw1969n7KCpuPHzH7u7+vlV
 gbqeRJPmdG7JDhQ0+uIh389fcIqMcIA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-rac5QETlMlmKo8y0Yv2pbg-1; Wed, 10 May 2023 05:00:19 -0400
X-MC-Unique: rac5QETlMlmKo8y0Yv2pbg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f1763fac8bso43903105e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709218; x=1686301218;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G+l00LP9nvQjDKaf7hL/2agM7QmmdtBjvbD16d70YE4=;
 b=jjZCDJtUcNe/H8KV67w9m+s/VdRcqSt9lVMUak2zajP256Rd+eCO1G75hf1WIYXAVs
 yLk0nShCPaeFcoPNfQJOnod4dc9AnSX7YbXoAxlhoN/xnTxgml8XPHoG6evmb5gGYN+W
 km56GJ7k1G9WWAi+H7k1i1vSg3yMSZ11HAQOfbTEXNkGFFONEmbYR9jkS/MtEjluZLXT
 QYsP3l2CjTxs802SM5n2TuXezku1W70gCu0tVNVEh0tHoEHJRdKaNN/456rvXXmnti6h
 JU4oRxsT1/0eWw+o4V/RBqdlWgcb40T+EFXadaPdiAARfTgRBxwIVHTAYqm/p8SGN465
 gBTA==
X-Gm-Message-State: AC+VfDySBKBTE4usL8nJGrUvnT6ErniJepGT0DhIGUsLetMVgyginOKq
 NdEMv3CbBPdsmnQMMbgUbTiBXeOlaeI1nF50g/rL3joxOtrQ09IB7pr1CEemWLry2m+QrcDKmZd
 R6T+j+cVu7NPDTfw=
X-Received: by 2002:a7b:cd04:0:b0:3f1:9527:8e8a with SMTP id
 f4-20020a7bcd04000000b003f195278e8amr11021867wmj.21.1683709218481; 
 Wed, 10 May 2023 02:00:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mFsifrTkRQcs7N5tJoJ4fr1sb3ZdjsOZtGzF1aVVuEuURlzPTBFpZ/MtLNNi0MKFoAm5DLw==
X-Received: by 2002:a7b:cd04:0:b0:3f1:9527:8e8a with SMTP id
 f4-20020a7bcd04000000b003f195278e8amr11021850wmj.21.1683709218203; 
 Wed, 10 May 2023 02:00:18 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 t6-20020a1c7706000000b003f42cc7aac4sm3653759wmi.37.2023.05.10.02.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 02:00:17 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,  Peter Xu
 <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Yishai Hadas <yishaih@nvidia.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Maor Gottlieb <maorg@nvidia.com>,  Kirti
 Wankhede <kwankhede@nvidia.com>,  Tarun Gupta <targupta@nvidia.com>,  Joao
 Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 6/8] vfio/migration: Refactor vfio_save_block() to
 return saved data size
In-Reply-To: <20230501140141.11743-7-avihaih@nvidia.com> (Avihai Horon's
 message of "Mon, 1 May 2023 17:01:39 +0300")
References: <20230501140141.11743-1-avihaih@nvidia.com>
 <20230501140141.11743-7-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 11:00:16 +0200
Message-ID: <87zg6c8stb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Avihai Horon <avihaih@nvidia.com> wrote:
> Refactor vfio_save_block() to return the size of saved data on success
> and -errno on error.
>
> This will be used in next patch to implement VFIO migration pre-copy
> support.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

And this is independent of this series.


