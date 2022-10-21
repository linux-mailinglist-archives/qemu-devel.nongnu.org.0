Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB80C607028
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:38:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollfd-0007z9-86
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:38:17 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollTX-0007oD-Vo
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1ollT8-0007Xv-II; Fri, 21 Oct 2022 02:25:28 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1ollT5-000715-4u; Fri, 21 Oct 2022 02:25:22 -0400
Received: from smtpclient.apple (unknown [159.226.43.11])
 by APP-01 (Coremail) with SMTP id qwCowACnrIw7O1JjKspSBg--.25282S2;
 Fri, 21 Oct 2022 14:25:00 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] hw/nvme: reenable cqe batching
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Y1IwDsaYc04+QhWu@cormorant.local>
Date: Fri, 21 Oct 2022 14:24:58 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 "open list:nvme" <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>
Content-Transfer-Encoding: 7bit
Message-Id: <12BB2604-9350-48EE-A6CB-6B8FB26DAF66@ict.ac.cn>
References: <20221020113538.36526-1-its@irrelevant.dk>
 <D059FE13-A269-4C82-9BE7-1FEA9F2AE53A@ict.ac.cn>
 <Y1IwDsaYc04+QhWu@cormorant.local>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowACnrIw7O1JjKspSBg--.25282S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw47XF1rurWrKr1DGrykXwb_yoW3Awb_XF
 W7AFyvkw4Utr97CFWDAFy5Ar1DKan8Xr45Aw4UJ3yjv3sxAa93uF48Kr4fZw4rWF4Utr15
 u390q3Z0qrsFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFkYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC2
 0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
 0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
 14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
 vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
 JVW8JbIYCTnIWIevJa73UjIFyTuYvjxUc_-PUUUUU
X-Originating-IP: [159.226.43.11]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

at 1:37 PM, Klaus Jensen <its@irrelevant.dk> wrote:

> On Okt 21 10:37, Jinhao Fan wrote:
>> at 7:35 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>> 
>>> Commit 2e53b0b45024 ("hw/nvme: Use ioeventfd to handle doorbell
>>> updates") had the unintended effect of disabling batching of CQEs.
>>> 
>>> This patch changes the sq/cq timers to bottom halfs and instead of
>>> calling nvme_post_cqes() immediately (causing an interrupt per cqe), we
>>> defer the call.
>> 
>> This change is definitely desired.
>> 
>>>                  | iops
>>> -----------------+------
>>>   baseline       | 138k
>>>   +cqe batching  | 233k
>> 
>> What is the queue depth config for this test?
> 
> That's 64. My box isnt nearly as beefy as yours ;)

:). The improvement looks great.

Reviewed-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>


