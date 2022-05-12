Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17085524B6F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 13:21:49 +0200 (CEST)
Received: from localhost ([::1]:55486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6t9-0006C9-4A
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 07:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1np6pg-0003DV-Oe
 for qemu-devel@nongnu.org; Thu, 12 May 2022 07:18:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1np6pe-0000pL-6e
 for qemu-devel@nongnu.org; Thu, 12 May 2022 07:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652354288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9qY3gXjwK5HXUdpkSLuqBruC5CkINjOShTC5hOwHfdc=;
 b=XTN9MuSLaUdcZSsHsbNH9iUObnMX4t0Dzeq1f2J9CZLotUeql3rOU306Q7Q5pd8oNL9XO5
 En8j2xhgOS39mIM6fs2Vp7sexyNd8fOtSCOQuE/qoZ7Ly9JpDeuPSytVw/7+JHStFcO/oA
 ++0LRZ7iyl0MPUWCl2eC+rD0/dGvJ7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-IEUwu_AxPpCMiirdgsTqfA-1; Thu, 12 May 2022 07:18:07 -0400
X-MC-Unique: IEUwu_AxPpCMiirdgsTqfA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37BFF90E984;
 Thu, 12 May 2022 11:18:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 648B457022B;
 Thu, 12 May 2022 11:18:06 +0000 (UTC)
Date: Thu, 12 May 2022 13:18:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, v.sementsov-og@mail.ru, qemu-block@nongnu.org
Subject: Re: [PATCH v4 0/2] nbd: MULTI_CONN for shared writable exports
Message-ID: <Ynzs7Y/rAUleob5Z@redhat.com>
References: <20220512004924.417153-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512004924.417153-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 12.05.2022 um 02:49 hat Eric Blake geschrieben:
> v3 was here:
> https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg03701.html
> with additional review here:
> https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg00166.html

Thanks, applied to the block branch.

Kevin


