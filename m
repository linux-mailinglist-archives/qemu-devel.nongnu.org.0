Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B262B552117
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:34:14 +0200 (CEST)
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JPp-0004K3-R7
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JK9-00057m-5Q
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3JK6-0002YF-OH
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738898;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8coMdguf0EA3MZqdl/8GQr2RqC7pHgYhJzRWclVSPo=;
 b=h4ERIAM746RJXuLz5lzN4jzAia78S+6QM4AsuD7MPwz4a+QCFRLC+vZ0vpJm0YIyt9SD7P
 iNnuj1sy+dKO4NauuNwl1NrnzjeynReI05nHAMsS30jW2Pnitz/kwxulE+jVpIMzHSXc0i
 ldjeAwVun+4bEF9bczrvAX8qaXY0jVU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-wzmTKdu0MHaIDQZpRQgqvg-1; Mon, 20 Jun 2022 11:28:16 -0400
X-MC-Unique: wzmTKdu0MHaIDQZpRQgqvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so5135723wms.6
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M8coMdguf0EA3MZqdl/8GQr2RqC7pHgYhJzRWclVSPo=;
 b=2Cd2LRzyTHrFJqcBKBJ+oCH5irGgQ+/MlHSFBSzB+5L8CnFzPgyYsSADqfIYzYMaU3
 jQMxO7ZRaqQHAOcjI/9CZ+pMk+EnVsamOXkrwGbS0YjyOqzJPTzGW32oV94QaE3u3xT2
 FP6gzNjJnw77iheBdcn3F7ToaHCHNDviDFRt95ovXS2tv8MROJzhlLSDAX5REigxHm3w
 XIxmrGsjGe9C8Skf+S46cNdsbjYnHwqrwoMLQ8fGXEmBHNJzlfQ0xe6bUM/aTEF7MrMf
 jOjhC5yNP8hkXkcSeLGrn6qZ8UgxqbR4iZoOd4GZvDGl6UTUWaMCzbsDSuaSY2lLCj99
 m//w==
X-Gm-Message-State: AOAM532ezpEaeAdzsNbeUdj9Pzwc/Lb2NovuCLJSXSeH/kvC2VOn7cPA
 Mfc5NJow4U/WctaorSHiHxWQurnECjcOQ7xGpLADx2xLaRdikmNk/Mbasr5DahF02c3I4RhgWXA
 8C4Vk8M2MhhtJr/E=
X-Received: by 2002:a05:600c:4e88:b0:39c:7c53:d7ff with SMTP id
 f8-20020a05600c4e8800b0039c7c53d7ffmr37209822wmq.176.1655738895265; 
 Mon, 20 Jun 2022 08:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjnAuOMbr6iAyrfBB/oqK6aeqecpW5UgYfwWIl6BoIJ4Hmxs5wpC5xr56UoFhJ3RTt5ysHwg==
X-Received: by 2002:a05:600c:4e88:b0:39c:7c53:d7ff with SMTP id
 f8-20020a05600c4e8800b0039c7c53d7ffmr37209799wmq.176.1655738895051; 
 Mon, 20 Jun 2022 08:28:15 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 j1-20020adfff81000000b00210bac248c8sm13472273wrr.11.2022.06.20.08.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:28:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 14/21] migration: remove unused QEMUFileGetFD typedef
 / qemu_get_fd method
In-Reply-To: <20220620110205.1357829-15-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:58
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-15-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:28:13 +0200
Message-ID: <87r13j1hiq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


