Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828E74ED682
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:07:20 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqlz-0003TU-K2
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:07:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZqaf-0000t0-EN
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZqac-0002pw-M3
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648716933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XoRT0ApbnQE2LA8iVzHfglcZSlMTx2ERY5yRhe7H0OQ=;
 b=ENgLx7jnv/xRb200sILPuAFX+NeL6ExBBQQ6OsmDLbRPGRx258s9q5Jwrt4nTKBEgi8YRc
 NsYGiBnvhjBXQtv40osomOhowehTZR/8bBTLdZHCS3mgxZoZ9NBk+vJI1ATf+obuqAbomx
 PJND0/t96bCPnRmOgQa02Ubc8wOHOfc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-c545AZHAORKvVMQhYrza-A-1; Thu, 31 Mar 2022 04:55:32 -0400
X-MC-Unique: c545AZHAORKvVMQhYrza-A-1
Received: by mail-lf1-f71.google.com with SMTP id
 v13-20020a056512096d00b004487e1503d0so7245509lft.4
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XoRT0ApbnQE2LA8iVzHfglcZSlMTx2ERY5yRhe7H0OQ=;
 b=CeOCjSqvDZ/PHvYjTAR7jj/UT3Hr//IEspT/ynwhRs4Gk6VZa28f8dpcx2SPGfBsPW
 Qo4mVtOYIin6LeaQAkRKKsspyCN9Bk2rlN964YQcS6g1ClHsVFCmaWmOkr53Q3pQzzh0
 h+0u1LGo2JEGj6Gy82Jdu7/AriuHUdLXzS85D3+xsmCn7mcj4XbHtBgBbl7L5Di77I9k
 wzubu6wPBZbpBz8rxEAzAZjjtsa+oO1PrsafR7K9XGuV92MxsMISyS87Le7c5Ias7S3w
 StxzxvkT0rQ7UvRpWkDnWSQ+b8X2p+1dh30xbWo/vQnBDXrhkWi8+PWK+wkb5glAEuwQ
 ap5g==
X-Gm-Message-State: AOAM5317/JKIfar1KCOAqXgC6S8LdXpWs97jk6xMvcS1fJ4hoGu5PFvN
 tSU0RVBn0bnhfC+3LriyVNsemaCiQX2LCPbrq2WP+cuvgOhvuexEa/WOH/5gajVNtzrmWNjYWP7
 QwsjeomfkKVqkShIZRiN4ABcnhDlR5dw=
X-Received: by 2002:a05:651c:892:b0:249:9e23:15 with SMTP id
 d18-20020a05651c089200b002499e230015mr9916580ljq.492.1648716930719; 
 Thu, 31 Mar 2022 01:55:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy84wGVScr1FoFFJcyuiE/DVfeS0Qxx/dwFJ2fpQG2K7nVIDEhvsg7hunnEXzwRlCyq97b2gCumt2t1zElEVYM=
X-Received: by 2002:a05:651c:892:b0:249:9e23:15 with SMTP id
 d18-20020a05651c089200b002499e230015mr9916565ljq.492.1648716930506; Thu, 31
 Mar 2022 01:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <1648634561-12504-1-git-send-email-08005325@163.com>
 <1648703950-7321-1-git-send-email-08005325@163.com>
In-Reply-To: <1648703950-7321-1-git-send-email-08005325@163.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 31 Mar 2022 16:55:19 +0800
Message-ID: <CACGkMEuGiuQ9DYqpqp9QAWhSgMiRa_aMnYqdDU8vECZxdGRWXg@mail.gmail.com>
Subject: Re: [PATCH v3] vdpa: reset the backend device in the end of
 vhost_net_stop()
To: 08005325@163.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cindy Lu <lulu@redhat.com>, mst <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, eperezma <eperezma@redhat.com>,
 Michael Qiu <qiudayu@archeros.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 1:20 PM <08005325@163.com> wrote:

Hi:

For some reason, I see the patch as an attachment.

Thanks


