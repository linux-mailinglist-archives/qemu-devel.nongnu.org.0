Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FFB5249B2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:00:26 +0200 (CEST)
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5cP-0008Hr-58
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1np5Za-0005z8-E9
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1np5ZY-0003P9-UE
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652349447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIvHHyPixrifr0YOyHgAYKmOYtfvq0ZWYi7gtjd25qM=;
 b=Z/mTtZ25DhBAs7xrlvUSa4X23/q26U+mBhwcBTwyS9hF7wi9a5FdtXLzX/E9SimkLLN5tB
 ZUmKmbHj2bRKOnQa6Kf/Km3X9Kk1yWpqpAGzgkUia10WRzldHbsukxDaibEbRy8Ea1kuYs
 xXCH8BDu8OUCEQ0PC5Px4KN5yCZwFEA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-fbHBbqolNFWy9B3GU3hoGQ-1; Thu, 12 May 2022 05:57:25 -0400
X-MC-Unique: fbHBbqolNFWy9B3GU3hoGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C100A38C5C7B;
 Thu, 12 May 2022 09:57:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B275F40D2822;
 Thu, 12 May 2022 09:57:20 +0000 (UTC)
Date: Thu, 12 May 2022 11:57:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?utf-8?B?5oiQ5bedIOW8mOaouQ==?= <hnarukaw@yahoo-corp.jp>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Subject: Re: [PATCH 2/2] coroutine: Revert to constant batch size
Message-ID: <YnzZ/eedEb9j+VHE@redhat.com>
References: <20220510151020.105528-1-kwolf@redhat.com>
 <20220510151020.105528-3-kwolf@redhat.com>
 <41c8f1d4-be27-4110-33c0-b53a701a9cb6@yahoo-corp.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41c8f1d4-be27-4110-33c0-b53a701a9cb6@yahoo-corp.jp>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.05.2022 um 08:56 hat 成川 弘樹 geschrieben:
> Thank you for your fix.
> 
> I confirmed that after applying this patch, my intended performance
> improvement by 4c41c69e is still kept in our environment.

This is good news. Thank you for testing the patch!

Kevin


