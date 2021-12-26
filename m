Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06A47F82D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 17:02:30 +0100 (CET)
Received: from localhost ([::1]:51398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1Vyf-0002yK-Bg
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 11:02:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1n1VxQ-0002CM-Lz
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 11:01:14 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:57511
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1n1VxP-0002eR-2s
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 11:01:12 -0500
HMM_SOURCE_IP: 172.18.0.218:34892.1413726504
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.210 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id D57582800A4;
 Mon, 27 Dec 2021 00:00:56 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id f4a7a0c0bc2e4d4faed141f2477707eb for
 peterx@redhat.com; Mon, 27 Dec 2021 00:01:06 CST
X-Transaction-ID: f4a7a0c0bc2e4d4faed141f2477707eb
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <9b5a69a7-8d79-2608-8dab-e52fa534bff5@chinatelecom.cn>
Date: Mon, 27 Dec 2021 00:00:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v10 3/3] cpus-common: implement dirty page limit on
 virtual CPU
To: Peter Xu <peterx@redhat.com>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <d54bfe75d5d64e64a21bda977d40f62579cd0222.1639479557.git.huangy81@chinatelecom.cn>
 <YcVXLbqbWpcOdeAK@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <YcVXLbqbWpcOdeAK@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.063,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/24 13:14, Peter Xu 写道:
> On Tue, Dec 14, 2021 at 07:07:34PM +0800, huangy81@chinatelecom.cn wrote:
>> +void qmp_vcpu_dirty_limit(bool enable,
>> +                          bool has_cpu_index,
>> +                          uint64_t cpu_index,
>> +                          bool has_dirty_rate,
>> +                          uint64_t dirty_rate,
>> +                          Error **errp)
>> +{
>> +    static bool initialized;
> 
> IMHO this is not needed; if we're with a global state pointer then it's the
> same to check against that.
Sound good, this make code simpler.
> 
> The rest looks mostly good (besides the last proposal on API design which you
> got confirmation from Markus).
> 

