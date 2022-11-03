Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60820617DBC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:21:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqa9U-0007DX-VI; Thu, 03 Nov 2022 09:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oqa8c-00078u-Kg; Thu, 03 Nov 2022 09:20:08 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oqa8Y-00070l-Qg; Thu, 03 Nov 2022 09:20:06 -0400
Received: from [127.0.0.1] (unknown [221.220.143.85])
 by APP-05 (Coremail) with SMTP id zQCowABHTrb4v2Nj8v4PCA--.38383S2;
 Thu, 03 Nov 2022 21:19:53 +0800 (CST)
Message-ID: <3ffebed8-997d-e276-bf4a-c75508b0be11@ict.ac.cn>
Date: Thu, 3 Nov 2022 21:19:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 4/4] hw/nvme: add polling support
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, "open list:nvme"
 <qemu-block@nongnu.org>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
 <20220827091258.3589230-5-fanjinhao21s@ict.ac.cn>
 <Y1EswYz077swwhuc@cormorant.local>
 <D1741E76-294E-41F6-B87B-70C2A4CF778C@ict.ac.cn>
 <Y2OvzcfeawKWvvJ0@cormorant.local>
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <Y2OvzcfeawKWvvJ0@cormorant.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowABHTrb4v2Nj8v4PCA--.38383S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY47k0a2IF6F4UM7kC6x804xWl14x267AK
 xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
 A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I
 6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr
 1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
 0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z2
 80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK67AK6ry8MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7IU8pOJ5UUUUU==
X-Originating-IP: [221.220.143.85]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/2022 8:10 PM, Klaus Jensen wrote:
> I agree that the spec is a little unclear on this point. In any case, in
> Linux, when the driver has decided that the sq tail must be updated,
> it will use this check:
> 
>    (new_idx - event_idx - 1) < (new_idx - old)

When eventidx is already behind, it's like:

  0
  1 <- event_idx
  2 <- old
  3 <- new_idx
  4
  .
  .
  .

In this case, (new_idx - event_idx - 1) = 3-1-1 = 1 >= (new_idx - old) = 
3-2=1, so the host won't update sq tail. Where am I wrong in this example?

> 
> So it doesn't account for if or not eventidx was already behind.


