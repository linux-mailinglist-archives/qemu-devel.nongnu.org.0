Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4740C3B6FB9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 10:52:27 +0200 (CEST)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9Tl-0005W4-UF
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 04:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ly9SY-0004bp-UU
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 04:51:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40492 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ly9SV-0003XX-MT
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 04:51:10 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Bx4OL03tpgDzsaAA--.9415S3;
 Tue, 29 Jun 2021 16:51:01 +0800 (CST)
Subject: Re: [PATCH 06/20] target/loongarch: Add main translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-7-git-send-email-gaosong@loongson.cn>
 <3b3ad9db-ed86-1ef4-5653-1c7106bc5bfd@amsat.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <88f8eaba-f99a-5865-898f-29a9f4b418f2@loongson.cn>
Date: Tue, 29 Jun 2021 16:50:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3b3ad9db-ed86-1ef4-5653-1c7106bc5bfd@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Bx4OL03tpgDzsaAA--.9415S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4kArWxtry7Jr4rAw1UKFg_yoW8XF1Upr
 17Cw1rKa18JrW7Jr4fGa1Yqr13Jr4rCFWjqa4IqryfArWaq34xArykt3sFkFy7X347uF1Y
 qF4Yvryj9F17G3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On 06/29/2021 02:46 AM, Philippe Mathieu-Daudé wrote:
> On 6/28/21 2:04 PM, Song Gao wrote:
>> This patch add main translation routines and
>> basic functions for translation.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  target/loongarch/helper.h    |  10 +
>>  target/loongarch/op_helper.c |  28 +++
>>  target/loongarch/translate.c | 537 +++++++++++++++++++++++++++++++++++++++++++
>>  target/loongarch/translate.h |  58 +++++
>>  4 files changed, 633 insertions(+)
>>  create mode 100644 target/loongarch/helper.h
>>  create mode 100644 target/loongarch/op_helper.c
>>  create mode 100644 target/loongarch/translate.c
>>  create mode 100644 target/loongarch/translate.h
> 
>> +/* 128 and 256 msa vector instructions are not supported yet */
>> +static bool decode_lsx(uint32_t opcode)
>> +{
>> +    uint32_t value = (opcode & 0xff000000);
>> +
>> +    if ((opcode & 0xf0000000) == 0x70000000) {
>> +        return true;
>> +    } else if ((opcode & 0xfff00000) == 0x38400000) {
>> +        return true;
>> +    } else {
>> +        switch (value) {
>> +        case 0x09000000:
>> +        case 0x0a000000:
>> +        case 0x0e000000:
>> +        case 0x0f000000:
>> +        case 0x2c000000:
>> +        case 0x30000000:
>> +        case 0x31000000:
>> +        case 0x32000000:
>> +        case 0x33000000:
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}
> 
> Why not generate that with the decodetree script?
> 
These instructions are privileged instructions， user mode does not need these instructions.
I'll delete these codes.

thanks 


