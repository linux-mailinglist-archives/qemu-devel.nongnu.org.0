Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCFE3B062D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:49:28 +0200 (CEST)
Received: from localhost ([::1]:58036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgmN-0000aT-0A
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvgl0-0008JY-U6
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:48:02 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:46159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvgky-0003sW-O5
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:48:02 -0400
Received: from [192.168.100.1] ([82.142.21.22]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MjxW4-1lXJIr4236-00kPtx; Tue, 22 Jun 2021 15:47:58 +0200
To: Takashi Yamamoto <yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
 <20210531055019.10149-2-yamamoto@midokura.com>
 <5c344989-6b77-5cb7-4e2d-953350fe9834@vivier.eu>
 <CAH=wFzS_-q4wRauFPKLrAf6p=oew_Ja+QpEvpyX97sYC39LnmQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 01/11] linux-user: handle /proc/self/exe for execve
Message-ID: <7505eafb-a247-6b43-3c61-24183a4bdb42@vivier.eu>
Date: Tue, 22 Jun 2021 15:47:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAH=wFzS_-q4wRauFPKLrAf6p=oew_Ja+QpEvpyX97sYC39LnmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k1MTANEEwM8pkElhYlKoJKXosGcp1qhQH5ufzYQunj892F+y6FG
 HWZ+YS3IL0Z8mkxO+ogOg/0QRsHYoL5K+PXvUfAerVU2cxHdp85s/JpEbgHFxr63ImeJo0B
 TjNK9craY1FXGaylAI+n36Vgz7x7gLIGCLd46BpM3TE8Pb2kHtCUDKFjm2J+4c5lS1E3Y1r
 fq6cPeln5eOeXR7r30mZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gwi9+f6IFJU=:9OD2TtRdjFJ1niIHPk3ZYH
 AxnX3Ser/tZXG6deWG1oebir44wG+LCn8rOoTZqC4XiRHI/q16bfeiovTD73lqMPJE58xKnS+
 q/YnM/SFPZ6zuuMHxv0hMUMJp9ImB9VM08En7jCfVzgY7phxSWF+GtQy3Y6zRROUCycqjsbPc
 3vMBJB1SPu+QHitv0RPzm4zmkosKrjNZezzvQqUfV/AwR3MaQXNmJ/bOxhrNmkARhhw1uO1Cz
 oaNmPZW7YX/cLV9yhLLl1etPkywYvtdF6D0qccq0QaMk+QeBjJC6DVWBZJ6osz2BPS8phf0B+
 G+ScPyqytXiBiPiaDMG5rnTRTHVbrQV013Ws/ksB5cZ/+y22yxDj0JCu90QAOqpjhYMhd92cU
 cMDQj5tjC6tdsUqNBu+fk1XCzjJC20uoiVHIt+3kCKSSrpkZyKeAJM7j9/Hdg4uoTXBsLSP6B
 cKZUQlBCerqpzinoOWiIBIfEocFNY3jZYKFJHQ9nkDdg71hTbozxItS3Y0awHjNSdbk1OG6HJ
 SHN234O0AJ4WiN50amb/Rw=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/06/2021 à 04:02, Takashi Yamamoto a écrit :
> On Sun, Jun 20, 2021 at 11:14 PM Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 31/05/2021 à 07:50, YAMAMOTO Takashi a écrit :
>>> It seems somehow common to execve /proc/self/exe in docker
>>> or golang community these days.
>>> At least, moby "reexec" and runc "libcontainer" do that.
>>>
>>> Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
>>> ---
>>>  linux-user/syscall.c | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index c9f812091c..a2b03ecb8b 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -8470,6 +8470,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>>  #endif
>>>      case TARGET_NR_execve:
>>>          {
>>> +            const char *path;
>>>              char **argp, **envp;
>>>              int argc, envc;
>>>              abi_ulong gp;
>>> @@ -8537,7 +8538,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>>               * before the execve completes and makes it the other
>>>               * program's problem.
>>>               */
>>> -            ret = get_errno(safe_execve(p, argp, envp));
>>> +            path = p;
>>> +            if (is_proc_myself(path, "exe")) {
>>> +                path = exec_path;
>>> +            }
>>> +            ret = get_errno(safe_execve(path, argp, envp));
>>>              unlock_user(p, arg1, 0);
>>>
>>>              goto execve_end;
>>>
>>
>> The problem here is QEMU can fail to execute the file directly.
> 
> i don't understand this sentence. can you explain a bit?

It's related to the text below.
The binary can be executable ('x') but not readable ('r'), so QEMU cannot load it.
It's the purpose of the 'O' flag: kernel opens the file and pass the FD to QEMU to execute it.

Thanks,
Laurent

> 
>>
>> The binary can be launched with binfmt_misc and the 'O' flag:
>>
>>      ``O`` - open-binary
>>             Legacy behavior of binfmt_misc is to pass the full path
>>             of the binary to the interpreter as an argument. When this flag is
>>             included, binfmt_misc will open the file for reading and pass its
>>             descriptor as an argument, instead of the full path, thus allowing
>>             the interpreter to execute non-readable binaries. This feature
>>             should be used with care - the interpreter has to be trusted not to
>>             emit the contents of the non-readable binary.
>>
>> You should use do_openat() (that resolves the /proc/self/exe path) and fexecve().
> 
> i thought there was an issue with the approach. but i don't remember
> what it was.
> maybe i will retry it.
> 
>>
>> Thanks,
>> Laurent


