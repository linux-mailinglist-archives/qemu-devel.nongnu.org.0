Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAB2B5618
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 02:14:37 +0100 (CET)
Received: from localhost ([::1]:47394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kepZs-0005va-5f
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 20:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kepYk-0005Tw-JK; Mon, 16 Nov 2020 20:13:26 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kepYh-0000zx-Np; Mon, 16 Nov 2020 20:13:26 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CZnxK0dBqzLlmn;
 Tue, 17 Nov 2020 09:12:53 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 17 Nov 2020 09:13:02 +0800
Message-ID: <5FB3239E.6030709@huawei.com>
Date: Tue, 17 Nov 2020 09:13:02 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 2/2] plugins: Fix two resource leaks in connect_socket()
References: <5F9975F1.4080205@huawei.com>
 <c91f4827-0be0-b0d1-f183-d3d868079a50@redhat.com>
In-Reply-To: <c91f4827-0be0-b0d1-f183-d3d868079a50@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 20:13:14
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 zhengchuan@huawei.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/17 0:50, Thomas Huth wrote:
> On 28/10/2020 14.45, AlexChen wrote:
>> Either accept() fails or exits normally, we need to close the fd.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: AlexChen <alex.chen@huawei.com>
>> ---
>>  contrib/plugins/lockstep.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
>> index 319bd44b83..5aad50869d 100644
>> --- a/contrib/plugins/lockstep.c
>> +++ b/contrib/plugins/lockstep.c
>> @@ -268,11 +268,13 @@ static bool setup_socket(const char *path)
>>      socket_fd = accept(fd, NULL, NULL);
> 
> I think you could also simply close(fd) here instead, then you don't have to
> do it twice below.
> 

Hi Thomas and Alex,
Thanks for your suggestion. It's a simple and effective solution.
Considering that the patch v3 has been queued by Alex Bennée,
May I modify this patch and then send patch v4?

Thanks,
Alex

> 
>>      if (socket_fd < 0 && errno != EINTR) {
>>          perror("accept socket");
>> +        close(fd);
>>          return false;
>>      }
>>
>>      qemu_plugin_outs("setup_socket::ready\n");
>>
>> +    close(fd);
>>      return true;
>>  }
>>
> 
> .
> 


