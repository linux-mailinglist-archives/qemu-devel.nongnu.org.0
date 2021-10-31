Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505AD441046
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 20:01:40 +0100 (CET)
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhG5J-0003HV-On
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 15:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhG3J-0002Wm-H2
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 14:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhG3F-0002Zm-W5
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 14:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635706767;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/4kG6bMV5loA1A9FHzGwLm47Xc3PteREau0B796BFM=;
 b=jBVg+KqK1+u4640go6iBkOtkfSy4v/KDgpgvJ1qccnjtLn3XZ18+Y89ucqUAg4+dDxVDt3
 cgP5xKE2ZVOC2Rc/b3mGsdWxRXXd5veIqHziEGpTVW6I+5x5jRu//vq5ZnRwdOQ6q6F5Gu
 s4uXCe4WQZTKT8x1Yfyi9HVkkmB3lGM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-grvVElBaMG6uAvKwFjh6ww-1; Sun, 31 Oct 2021 14:59:24 -0400
X-MC-Unique: grvVElBaMG6uAvKwFjh6ww-1
Received: by mail-wr1-f70.google.com with SMTP id
 q5-20020a5d5745000000b00178abb72486so3541137wrw.9
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 11:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/4kG6bMV5loA1A9FHzGwLm47Xc3PteREau0B796BFM=;
 b=TgJywu66tsdtu4WTuiu63gCbNvj9z2BniuyWRRdnQENsG23yVk7MRE50pDQ6Ot4Qg1
 vYTRye1it3RSqIVP+/i6r+oR5HHuC2UOwFmrq2+q4gDiDpIGauCSV1R6c/XjYm0aHNCl
 mpZja0MQlK98OWTGP6SURu/8Ov/J9iGA2tMQ0mSYcdt1UOE3vKrSZ6IRkX76T+LEu+0j
 GV+9v9haGX/kDS1nPQZD2E6vQJA68YcJ5EItmonshl18UcYCPEY6oqhWUMFugpwMDQ6I
 YNdgFP2l0sdYBBlTVfRzhDs66jRk7AGZCpaCd52hiAMP9oN+Fkkj64V37iUm+EXepiDB
 glcw==
X-Gm-Message-State: AOAM533WaAgkC7zktNemygXQ/NXOYwUpfmshJWnNyAoHkuqZzroryOIy
 Vb2YTwL7FZxSSGJnqJfM/kIkEs5VSGkjEwzIlm+dBSvZV5vAPRrInbCDTthCV3uJ434rs/Rdazm
 AwrSGBi3TaBRsCeE=
X-Received: by 2002:a05:600c:4a27:: with SMTP id
 c39mr14031037wmp.101.1635706763088; 
 Sun, 31 Oct 2021 11:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSuUBBToMZtFRRwyz33tJ9ibJ+rkz4BtRbW3+NAw8h4vD2Zr4BCuLyo4hInMYsaw49tmGyZQ==
X-Received: by 2002:a05:600c:4a27:: with SMTP id
 c39mr14031002wmp.101.1635706762896; 
 Sun, 31 Oct 2021 11:59:22 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id a26sm10170372wmm.46.2021.10.31.11.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Oct 2021 11:59:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH v5 01/26] util: Make some iova_tree parameters const
In-Reply-To: <20211029183525.1776416-2-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Fri, 29 Oct 2021 20:35:00 +0200")
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-2-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Sun, 31 Oct 2021 19:59:21 +0100
Message-ID: <87a6iprpfa.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>, virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> As qemu guidelines:
> Unless a pointer is used to modify the pointed-to storage, give it the
> "const" attribute.
>
> In the particular case of iova_tree_find it allows to enforce what is
> requested by its comment, since the compiler would shout in case of
> modifying or freeing the const-qualified returned pointer.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Acked-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

This patch can go in already, whose tree should this go through?

Later, Juan.


