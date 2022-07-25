Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982657F85B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 04:51:00 +0200 (CEST)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFoBO-0006Vn-NS
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 22:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oFo9e-0005A5-Mm
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 22:49:10 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:36296 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oFo9a-00051k-TZ
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 22:49:10 -0400
Received: from smtpclient.apple (unknown [159.226.43.13])
 by APP-01 (Coremail) with SMTP id qwCowAAHTJyPBN5ioAS4AQ--.30164S2;
 Mon, 25 Jul 2022 10:48:49 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <CAJSP0QVPqzck4RTiQmjHpeAvZ1PEZCjjvdpwSdJ836Zw6HG22w@mail.gmail.com>
Date: Mon, 25 Jul 2022 10:48:47 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Klaus Birkelund Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <15040CA1-AECF-4A25-A904-47090DFDA198@ict.ac.cn>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
 <4BB551D8-F877-4382-A4B9-D6913580AAE1@ict.ac.cn>
 <CAJSP0QUf4K=N7ZDAXrB3WvUxx4DoA4Sg0hSTri1WKGTnsMtN2g@mail.gmail.com>
 <DC2847BE-EE1B-4496-9270-C04A4DDF3A7F@ict.ac.cn>
 <CAJSP0QVPqzck4RTiQmjHpeAvZ1PEZCjjvdpwSdJ836Zw6HG22w@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: qwCowAAHTJyPBN5ioAS4AQ--.30164S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1furWxXw15Ar1kKF1rJFb_yoW3JFc_ZF
 15ta97Cw4Ikr9rta4rKr4rArWDZFs5WF4Yvws0gFy5Jw47Ja4DuFWvgF1ru3Z8Gws5Xr43
 Krn0qr93XFy3WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbw8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC2
 0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
 0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
 14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
 vaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
 6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jeXdbUUUUU=
X-Originating-IP: [159.226.43.13]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

at 3:36 AM, Stefan Hajnoczi <stefanha@gmail.com> wrote:

> 
> 
> On Sun, Jul 24, 2022, 11:21 Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
> at 9:29 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> 
> > 
> > Nice, perf(1) is good for that. You can enable trace events and add
> > kprobes/uprobes to record timestamps when specific functions are entered.
> > 
> 
> Thanks Stefan,
> 
> One last question: Currently we can achieve hundreds of KIOPS. That means
> perf can easily capture millions of trace events per second. I found perf
> has quite high overhead at such a rate of trace events. Do you have any
> advices on tracing high IOPS tasks?
> 
> I don't. BTW uprobes are expensive but kprobes are cheaper.
> 
> Stefan

Gotcha. Thanks!

Jinhao Fan


