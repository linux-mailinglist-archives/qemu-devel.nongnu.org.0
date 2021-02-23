Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A820A3228C2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:22:06 +0100 (CET)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUpR-0000cl-8V
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1lEUo0-0008Fe-2Y; Tue, 23 Feb 2021 05:20:36 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1lEUnx-0008Qb-6f; Tue, 23 Feb 2021 05:20:35 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DlFQF3YrgzjQdD;
 Tue, 23 Feb 2021 18:19:01 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Feb 2021 18:20:08 +0800
Subject: Re: [PATCH v5 0/9] block: Add retry for werror=/rerror= mechanism
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
 <YDTNkWsYbj3u5ejF@stefanha-x1.localdomain>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <fc47618a-e445-1e86-ba4e-d80d91312799@huawei.com>
Date: Tue, 23 Feb 2021 18:20:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <YDTNkWsYbj3u5ejF@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=cenjiahui@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 fangying1@huawei.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 2021/2/23 17:40, Stefan Hajnoczi wrote:
> On Fri, Feb 05, 2021 at 06:13:06PM +0800, Jiahui Cen wrote:
>> This patch series propose to extend the werror=/rerror= mechanism to add
>> a 'retry' feature. It can automatically retry failed I/O requests on error
>> without sending error back to guest, and guest can get back running smoothly
>> when I/O is recovred.
> 
> This patch series implements a retry followed by werror/rerror=report
> after a timeout. This mechanism could be made more generic (and the code
> could be simplified) by removing the new werror/rerror=retry action and
> instead implementing the retry/timeout followed by *any* werror=/rerror=
> policy chosen by the user.
> 
> In other words, if the retry interval is non-zero, retry the request and
> check for timeouts. When the timeout is reached, obey the
> werror=/rerror= action.
> 
> This is more flexible than hard-coding werror=retry to mean retry
> timeout followed by werror=report.
> 
> For example:
> 
>   werror=stop,write-retry-interval=1000,write-retry-timeout=15000,
>   rerror=report,read-retry-interval=1000,read-retry-timeout=15000
> 
> Failed write requests will be retried once a second for 15 seconds.
> If the timeout is reached the guest is stopped.
> 
> Failed read requests will be retried once a second for 15 seconds. If
> the timeout is reached the error is reported to the guest.

Sounds like a better way for me. I'll refactor this patch series under
your suggestion.

Also thanks for your review.

Thanks,
Jiahui

