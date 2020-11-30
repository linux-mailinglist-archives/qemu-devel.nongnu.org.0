Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821BB2C8171
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:53:56 +0100 (CET)
Received: from localhost ([::1]:59476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfsZ-0002nK-9K
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kjfoL-0000R9-2v; Mon, 30 Nov 2020 04:49:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kjfoI-0007vn-B6; Mon, 30 Nov 2020 04:49:32 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cl0mh5rLQz15Vbp;
 Mon, 30 Nov 2020 17:48:52 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Nov 2020 17:49:10 +0800
Message-ID: <5FC4C015.1000800@huawei.com>
Date: Mon, 30 Nov 2020 17:49:09 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] contrib/rdmacm-mux: Fix error condition in
 hash_tbl_search_fd_by_ifid()
References: <5F9AC6FF.4000301@huawei.com>
 <CAC_L=vVg=YitEAKE+wGEmphuL8Eu87mYDiYD=UNKGhqOyd8PpQ@mail.gmail.com>
 <5FBCF8F0.9060103@huawei.com>
 <CAFEAcA985RuM96HP4mvHmU-ffAsQWv4hFFABXQ2ZW_t5Uts7vg@mail.gmail.com>
 <5FBDB096.3040600@huawei.com>
 <CAC_L=vXkncoeBO48-Zkie=pm20_CT-Ee1y5HyQqGtc2EK9fnFg@mail.gmail.com>
In-Reply-To: <CAC_L=vXkncoeBO48-Zkie=pm20_CT-Ee1y5HyQqGtc2EK9fnFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, QEMU <qemu-devel@nongnu.org>,
 zhengchuan@huawei.com, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/30 2:35, Marcel Apfelbaum wrote:
> Hi Alex,
> 
> On Wed, Nov 25, 2020 at 3:17 AM Alex Chen <alex.chen@huawei.com <mailto:alex.chen@huawei.com>> wrote:
> 
>     On 2020/11/24 23:29, Peter Maydell wrote:
>     > On Tue, 24 Nov 2020 at 12:15, Alex Chen <alex.chen@huawei.com <mailto:alex.chen@huawei.com>> wrote:
>     >>
>     >> Hi everyone，
>     >>
>     >> Who can help me merge this patch into the master branch? This patch may be need for qemu-5.2
>     >
>     > This code has been like this since 2018, so this is not
>     > a regression in 5.2. At this point in the release cycle
>     > (rc3 imminent) I think it's best to just leave it until 6.0.
>     >
> 
>     OK, I see.
> 
> 
> I will send  a pull request as soon as the 6.0 cycle starts.
> 

Thank you.



