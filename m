Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E72F458F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:52:24 +0100 (CET)
Received: from localhost ([::1]:48590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzax5-0000wg-17
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@0bits.com>) id 1kzavw-0000Rm-Hw
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:51:12 -0500
Received: from uk.hasbox.com ([2a01:7e00::f03c:91ff:fe91:5fdc]:51147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@0bits.com>) id 1kzavu-0003fP-Mv
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:51:12 -0500
Received: from [10.0.0.170] ([5.30.22.212]) (authenticated bits=0)
 by uk.hasbox.com (8.15.2/8.15.2) with ESMTPSA id 10D7p5dq011271
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 13 Jan 2021 07:51:07 GMT
Subject: Re: absolute firmware path made relocatable in qemu 5.2.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <abd662c1-9a4a-9c77-6533-875ab1924695@0bits.com>
 <c9b36f34-8783-9c11-ffb9-afd25fdf9ac0@redhat.com>
 <428592f1-a5fd-7e6a-f181-28f31343518a@0bits.com>
 <CABgObfaZECGDvgsvebx44h84okDMKWZFw1ZtqcXk8W9SaD38Zg@mail.gmail.com>
 <3ab19db3-7339-79d5-9f4f-aee7165b531a@0bits.com>
 <536bbda3-ebcb-e098-2625-5de4db08422e@redhat.com>
From: Dave <dave@0bits.com>
Message-ID: <e132f0dd-e9ee-5519-e539-ceb760b7c6a6@0bits.com>
Date: Wed, 13 Jan 2021 11:51:00 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <536bbda3-ebcb-e098-2625-5de4db08422e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a01:7e00::f03c:91ff:fe91:5fdc;
 envelope-from=dave@0bits.com; helo=uk.hasbox.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is my qemu binary compiled with --prefix=/nonexistent


bash-5.1# ./qemu-system-x86_64 -L help
/usr/share/qemu
/usr/share/qemu-firmware
/usr/src/sources/qemu-5.2.0/build/pc-bios

bash-5.1# ./qemu-system-x86_64 --help|grep helper
 
[,br=bridge][,helper=helper][,sndbuf=nbytes][,vnet_hdr=on|off][,vhost=on|off]
                 use network helper 'helper' 
(default=/nonexistent/libexec/qemu-bridge-helper) to
-netdev bridge,id=str[,br=bridge][,helper=helper]
                 using the program 'helper 
(default=/nonexistent/libexec/qemu-bridge-helper)

See that it will call /nonexistent/libexec/qemu-bridge-helper by default.

Dave

On 12/01/2021 23:53, Paolo Bonzini wrote:
> On 12/01/21 18:04, Dave wrote:
>> Thanks Paola,
>>
>> We are still in testing and that's the only thing we've uncovered so 
>> far with the new 5.2.0. I will post if the ops guys find anything else.
> 
> Hmm, that's weird though.  The path to the default bridge helper is 
> relocated:
> 
> net/tap.c:        helper = default_helper = 
> get_relocated_path(DEFAULT_BRIDGE_HELPER);
> 
> Paolo
> 

