Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E8A68A34E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 20:58:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO2As-0003Ea-Vb; Fri, 03 Feb 2023 14:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO2Ar-0003EQ-KJ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:56:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pO2Aq-0002cr-2B
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675454198;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9mzwRbtD7fmdnt8Kddu8Skwzp15f1cQVaMXwD9oS//w=;
 b=Yrv2HlTXsW82U/heKSvjVsvU16k6VTKQBe5XxMy0F64hAgXhwJI2YWttTDBSOyD6xHk/hm
 gUdm18SlUhzxgf0TM8knHBZ8vASj9yAKP+/pwvbY5eNhjmqPel2WpZkGhX9a6Qsa0b7sd8
 C5WD7W/zUfXSccqnPaSzOEh+UdItXWI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-329-LxA3FzCtPBWR8-0Y_K6SLw-1; Fri, 03 Feb 2023 14:56:37 -0500
X-MC-Unique: LxA3FzCtPBWR8-0Y_K6SLw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k17-20020a05600c1c9100b003dd41ad974bso3159529wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 11:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mzwRbtD7fmdnt8Kddu8Skwzp15f1cQVaMXwD9oS//w=;
 b=Rn+D3QdBCExCRS8FMk6gaF/mUaxiHJyv5I9OCuBCrbMv0s+FKTd2zk6P3vLK7CJTGG
 f77onNuxtnlHUBVYaNk02iyaIyQYeeq/eVSIVsPqqhohBbvNxwT8TJ1yWs00H2yEOlQa
 FC+Urd53LUY/lEaay3TkFxQd3q4dXY7N6jq/+vh0UtW7As0bP3EyHi6+abKnGLCpH7K5
 7icgx0+NFjEyuSwfzPU5Syjs1Y3H13xYFBsKGu++rfnoxrBkbySqrm7umXvc06aKTEC0
 i+DyPNYxiffKJ5lx6uOVA/EygEvf6YaCK+nuFd+QAoIZvaagl9ja1ezLfO694LYZGAMZ
 WRgw==
X-Gm-Message-State: AO0yUKVRCnXlPNxJgsdk5GnUGpwcY0mbpV9BL1ZyWLBTQBVPwqrkBqTN
 hx+FijYyCURjHM5N3yOwjQruOph+3yLwxFOqgYwabQnFgUVrzr5V0uhWWXr2gxjkjqjwp51FDo9
 jC8UZSOM36+XV9+k=
X-Received: by 2002:a05:600c:3c89:b0:3db:3476:6f02 with SMTP id
 bg9-20020a05600c3c8900b003db34766f02mr10488172wmb.41.1675454196503; 
 Fri, 03 Feb 2023 11:56:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/ro4dnc/8zYcoEa3cWlcuFY6F5XRJzjxH0sDiDy3ad7hfWc+knV/78t9hYD1LDoGY91Uk1nQ==
X-Received: by 2002:a05:600c:3c89:b0:3db:3476:6f02 with SMTP id
 bg9-20020a05600c3c8900b003db34766f02mr10488160wmb.41.1675454196257; 
 Fri, 03 Feb 2023 11:56:36 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b003dc51c48f0bsm9722532wms.19.2023.02.03.11.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 11:56:35 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <berrange@redhat.com>,  <dgilbert@redhat.com>,
 <yubihong@huawei.com>,  <xiexiangyou@huawei.com>,
 <zhengchuan@huawei.com>,  <linyilu@huawei.com>
Subject: Re: [PATCH V2 2/2] migration: save/delete migration thread info
In-Reply-To: <20230203073519.2969147-3-jiangjiacheng@huawei.com> (Jiang
 Jiacheng's message of "Fri, 3 Feb 2023 15:35:19 +0800")
References: <20230203073519.2969147-1-jiangjiacheng@huawei.com>
 <20230203073519.2969147-3-jiangjiacheng@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 03 Feb 2023 20:56:34 +0100
Message-ID: <87fsbmfrpp.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
> To support query migration thread infomation, save and delete
> thread(live_migration and multifdsend) information at thread
> creation and finish.
>
> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


