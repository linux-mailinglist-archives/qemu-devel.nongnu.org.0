Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46292458884
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 04:59:56 +0100 (CET)
Received: from localhost ([::1]:33688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp0Ul-0006kX-D9
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 22:59:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mp0TG-0005GN-88
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 22:58:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mp0TD-0005SR-M2
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 22:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637553498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QejhMNBGSf8GwLzEjMFunyBCaOf68ynMf70L9s+gHvM=;
 b=Avp/k0KvXiXmvlTdOvFA06Hn/7pg3KAJVgIKBe0hi0eIHUPAL6qjDdk1NJFjG+fHjeYlIJ
 JYKKq3kaZJsJmJsOhGm+Rg4R2sGjUl2XRncZogqnzKVfvRTp2jbIPfaJZwtm3hoigOmmVz
 VCv5j9H9PPxpUZZk5EK8qcy5tSzDltY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-e-H8i99lN6CWlDQu4CuuDA-1; Sun, 21 Nov 2021 22:58:17 -0500
X-MC-Unique: e-H8i99lN6CWlDQu4CuuDA-1
Received: by mail-lf1-f70.google.com with SMTP id
 u20-20020a056512129400b0040373ffc60bso11037999lfs.15
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 19:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QejhMNBGSf8GwLzEjMFunyBCaOf68ynMf70L9s+gHvM=;
 b=7Gen/1nA0qbmOwVkpf9vKyQ9H7SN3L9PG7AU4nVr5+5i9V+U4oLFZQkDMVbhOMNrre
 HwgSRrXkOZGx3iGORwD1J+34K263FybW08xvsffjFXeY0aS3W4H5bOrrf/y+hKrdONom
 lltXNu74rvikTbw8nlCDXa2ZpOYcuqKsYJaSBWtfsaj+t0avFEqBZmQho2/0bkTqAzdy
 dPaNI71CL4DGg6T/v1k1EA0hR6lNkKSmE5+y3hKjoyzbYebVFBFH58VZR4r05qjEknKM
 wyNQ4htCmeF30NTzpTOiJFDdvXsyvk3AvxJRb1YmbN406Fjap6AMdjRQMdiUj5EtReNn
 I5Ag==
X-Gm-Message-State: AOAM531+9U9U3WW8tWtJ0Cq8qerb6XzbDBO/47qqGGFGfiRFDKl6BQnv
 +3TQUF7x9B24DKlboZJKzJVlrr7qmiNULXCxNRbZF4ENvJxZYfyPEfM1fPhEcEPcff8HAPD5CfL
 3p1mq2GKszkFWi+kENIX2q2RrUtYG2Lc=
X-Received: by 2002:a2e:b742:: with SMTP id k2mr50488371ljo.107.1637553495636; 
 Sun, 21 Nov 2021 19:58:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw642tA2q6fnBoaaFWQrqnBxe8Pemf67Q2+JxOZmEMBk7P6QlVhk39F2dFvgIgpP4nV4ST2zP/4mOWjMihsWKM=
X-Received: by 2002:a2e:b742:: with SMTP id k2mr50488350ljo.107.1637553495452; 
 Sun, 21 Nov 2021 19:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20211119053506.290459-1-chen.zhang@intel.com>
 <20211119053506.290459-2-chen.zhang@intel.com>
In-Reply-To: <20211119053506.290459-2-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 22 Nov 2021 11:58:04 +0800
Message-ID: <CACGkMEu74XdxUgf794ws-FciSkGsyub5Kmi34a-cs+JPBRra+g@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] test/qtest/test-filter-mirror.c: Change the
 default vnet_hdr_support
To: Zhang Chen <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 1:45 PM Zhang Chen <chen.zhang@intel.com> wrote:
>
> As net filters changed default vnet_hdr_support=on.
> For this e1000 test case need to add vnet_hdr_support=off.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---

I squashed this into the previous patch to have a better bisection
behaviour and queue it for 7.0.

Thanks

>  tests/qtest/test-filter-mirror.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/test-filter-mirror.c b/tests/qtest/test-filter-mirror.c
> index bc0dee64dd..7756f8cfc1 100644
> --- a/tests/qtest/test-filter-mirror.c
> +++ b/tests/qtest/test-filter-mirror.c
> @@ -45,7 +45,7 @@ static void test_mirror(void)
>          "-netdev socket,id=qtest-bn0,fd=%d "
>          "-device %s,netdev=qtest-bn0,id=qtest-e0 "
>          "-chardev socket,id=mirror0,fd=%d "
> -        "-object filter-mirror,id=qtest-f0,netdev=qtest-bn0,queue=tx,outdev=mirror0 "
> +        "-object filter-mirror,id=qtest-f0,netdev=qtest-bn0,queue=tx,outdev=mirror0,vnet_hdr_support=off "
>          , send_sock[1], devstr, recv_sock[1]);
>
>      struct iovec iov[] = {
> --
> 2.25.1
>


