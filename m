Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD99262DCFA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:40:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovf6S-00046G-Ko; Thu, 17 Nov 2022 08:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovf6H-00044d-FG
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:38:41 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovf6A-0001VD-V8
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:38:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EDEF113FFAADC;
 Thu, 17 Nov 2022 14:38:29 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 17 Nov
 2022 14:38:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033e3bc4ca-bdd9-4517-8a55-f7a3a266e2d4,
 AE5717285A2AC47C671D2CB192D1CF6730B7D7F3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <33e63f5c-8a32-8093-6ce8-2641d0d8e325@kaod.org>
Date: Thu, 17 Nov 2022 14:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 02/12] tests/avocado: improve behaviour waiting for
 login prompts
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 <qemu-devel@nongnu.org>
CC: <fam@euphon.net>, <berrange@redhat.com>, <f4bug@amsat.org>,
 <aurelien@aurel32.net>, <pbonzini@redhat.com>, <stefanha@redhat.com>,
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221111145529.4020801-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e76b071b-d5c1-408a-ba90-bd348d7dfc1a
X-Ovh-Tracer-Id: 4131208236202101752
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhfrghmsegvuhhphhhonhdrnhgvthdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpfhegsghughesrghmshgrthdrohhrghdprghurhgvlhhivghnsegruhhrvghlfedvrdhnvghtpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpphhhihhlmhgusehlih
 hnrghrohdrohhrghdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello Alex,

On 11/11/22 15:55, Alex Bennée wrote:
> This attempts to deal with the problem of login prompts not being
> guaranteed to be terminated with a newline. The solution to this is to
> peek at the incoming data looking to see if we see an up-coming match
> before we fall back to the old readline() logic. The reason to mostly
> rely on readline is because I am occasionally seeing the peek stalling
> despite data being there.
> 
> This seems kinda hacky and gross so I'm open to alternative approaches
> and cleaner python code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I have pulled this patch in the aspeed tree hoping it would improve tests:

   AST2x00MachineSDK.test_arm_ast2500_evb_sdk
   AST2x00MachineSDK.test_arm_ast2600_evb_sdk

but the failure rate has increased :/ I have seen failures in these also :

   AST2x00Machine.test_arm_ast2500_evb_buildroot
   AST2x00Machine.test_arm_ast2600_evb_buildroot

which used to be quite stable.

Sorry, this is not of much help. the issue might be elsewhere.

Thanks for the time you spend on this.

C.


> ---
> v2
>    - remove superfluous /r/n
> ---
>   tests/avocado/avocado_qemu/__init__.py | 89 +++++++++++++++++++++++++-
>   1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index 910f3ba1ea..20cba57161 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -131,6 +131,58 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
>               return path
>       return None
>   
> +def _peek_ahead(console, min_match, success_message):
> +    """
> +    peek ahead in the console stream keeping an eye out for the
> +    success message.
> +
> +    Returns some message to process or None, indicating the normal
> +    readline should occur.
> +    """
> +    console_logger = logging.getLogger('console')
> +    peek_len = 0
> +    retries = 0
> +
> +    while True:
> +        try:
> +            old_peek_len = peek_len
> +            peek_ahead = console.peek(min_match).decode()
> +            peek_len = len(peek_ahead)
> +
> +            # if we get stuck too long lets just fallback to readline
> +            if peek_len <= old_peek_len:
> +                retries += 1
> +                if retries > 10:
> +                    return None
> +
> +            # if we see a newline in the peek we can let safely bail
> +            # and let the normal readline() deal with it
> +            if peek_ahead.endswith(('\n', '\r')):
> +                return None
> +
> +            # if we haven't seen enough for the whole message but the
> +            # first part matches lets just loop again
> +            if len(peek_ahead) < min_match and \
> +               success_message[:peek_len] in peek_ahead:
> +                continue
> +
> +            # if we see the whole success_message we are done, consume
> +            # it and pass back so we can exit to the user
> +            if success_message in peek_ahead:
> +                return console.read(peek_len).decode()
> +
> +            # of course if we've seen enough then this line probably
> +            # doesn't contain what we are looking for, fallback
> +            if peek_len > min_match:
> +                return None
> +
> +        except UnicodeDecodeError:
> +            console_logger.log("error in decode of peek")
> +            return None
> +
> +    # we should never get here
> +    return None
> +
>   
>   def _console_interaction(test, success_message, failure_message,
>                            send_string, keep_sending=False, vm=None):
> @@ -139,17 +191,52 @@ def _console_interaction(test, success_message, failure_message,
>           vm = test.vm
>       console = vm.console_socket.makefile(mode='rb', encoding='utf-8')
>       console_logger = logging.getLogger('console')
> +
> +    # Establish the minimum number of bytes we would need to
> +    # potentially match against success_message
> +    if success_message is not None:
> +        min_match = len(success_message)
> +    else:
> +        min_match = 0
> +
> +    console_logger.debug("looking for %d:(%s), sending %s (always=%s)",
> +                         min_match, success_message, send_string, keep_sending)
> +
>       while True:
> +        msg = None
> +
> +        # First send our string, optionally repeating the send next
> +        # cycle.
>           if send_string:
>               vm.console_socket.sendall(send_string.encode())
>               if not keep_sending:
>                   send_string = None # send only once
> +
> +        # If the console has no data to read we briefly
> +        # sleep before continuing.
> +        if not console.readable():
> +            time.sleep(0.1)
> +            continue
> +
>           try:
> -            msg = console.readline().decode().strip()
> +
> +            # First we shall peek ahead for a potential match to cover waiting
> +            # for lines without any newlines.
> +            if min_match > 0:
> +                msg = _peek_ahead(console, min_match, success_message)
> +
> +            # otherwise we block here for a full line
> +            if not msg:
> +                msg = console.readline().decode().strip()
> +
>           except UnicodeDecodeError:
> +            console_logger.debug("skipped unicode error")
>               msg = None
> +
> +        # if nothing came out we continue and try again
>           if not msg:
>               continue
> +
>           console_logger.debug(msg)
>           if success_message is None or success_message in msg:
>               break


