Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151636C766B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 05:04:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfWMT-0006lW-DF; Thu, 23 Mar 2023 21:36:57 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pfWMQ-0006kS-6a
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 21:36:54 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pfWMD-0002Vx-Ci
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 21:36:50 -0400
HMM_SOURCE_IP: 172.18.0.188:44192.505816087
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 0252B2800FE;
 Fri, 24 Mar 2023 09:36:12 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([36.111.64.85])
 by app0023 with ESMTP id 739bec192f034b24a2397aec3ec4eaa4 for
 armbru@redhat.com; Fri, 24 Mar 2023 09:36:19 CST
X-Transaction-ID: 739bec192f034b24a2397aec3ec4eaa4
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 36.111.64.85
X-MEDUSA-Status: 0
Message-ID: <3ccd31fb-f3e2-5b9e-11a1-43e422389592@chinatelecom.cn>
Date: Fri, 24 Mar 2023 09:36:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Example output for query-vcpu-dirty-limit
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 David Alan Gilbert <dgilbert@redhat.com>
References: <87mt43zr6j.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87mt43zr6j.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2023/3/23 18:40, Markus Armbruster 写道:
> query-vcpu-dirty-limit's doc comment has an example, but it shows only
> input, no output:
> 
>      ##
>      # @query-vcpu-dirty-limit:
>      #
>      # Returns information about virtual CPU dirty page rate limits, if any.
>      #
>      # Since: 7.1
>      #
>      # Example:
>      #   {"execute": "query-vcpu-dirty-limit"}
>      #
>      ##
> 
> The simplest fix is
> 
>      # Example:
>      # -> {"execute": "query-vcpu-dirty-limit"}
>      # <- {"return": []}
> 
> But I'd rather show a non-empty reply here.  I don't want to make one
> up, because making up example output tends to result in incorrect
> examples.  Could you run the command for me in context where it returns
> non-empty output?
> 

The following shows vm dirty-limit info with two vcpus using qmp command.

# virsh qemu-monitor-command c1b1066a-2549-076d-462d-1d97cd5de712 
'{"execute":"query-vcpu-dirty-limit"}' --pretty
{
   "return": [
     {
       "limit-rate": 60,
       "current-rate": 3,
       "cpu-index": 0
     },
     {
       "limit-rate": 60,
       "current-rate": 3,
       "cpu-index": 1
     }
   ],
   "id": "libvirt-20155"
}

-- 
Best regard

Hyman Huang(黄勇)

