Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E97E3CB5B7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 12:09:05 +0200 (CEST)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4KmG-000639-JV
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 06:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Kkn-0004Xe-Jl
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:07:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Kki-00041H-Jg
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626430041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQsGH1WiDqXdt4539LKTU77fKJDqVpkVm9Nwu+vkT3A=;
 b=cDi03Rrxt9C3eE+DIMXJpXYAuG7bGCN2LmAmrf4ZZ2T7f3lsTsj7dxIgRuW5nWTrXK97TQ
 hjRQGlqAhkwnrqkelaP9ljRukJuB8eXp0d6FEXk+dlRnH7XHrnzt0EqCc0mjTFcK1l4UhM
 MNyExyo1zYVUQZjZnxlXnn0PUzzaAxc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-MD8GUe1pNGeoER9FjigDRg-1; Fri, 16 Jul 2021 06:07:18 -0400
X-MC-Unique: MD8GUe1pNGeoER9FjigDRg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so4586630wrs.3
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 03:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DQsGH1WiDqXdt4539LKTU77fKJDqVpkVm9Nwu+vkT3A=;
 b=sKM3hzVceJeYBPSHju22zxglerIQjq51kVItIfwb9oELB0wFS1cHWqwth+92UXbv5Y
 /jy3pXQwAlxl9GRKU13gGFzDCDg6Zyks+6GqF2gIi+KpLhaQeKOwbddoUz12FRT5VpoL
 2CSdK1jMZy97I87XufRjP0LkFEa1h1JdR3V3Ys8bGINSEAbPWiQPc2GT+U1WDVyCu53J
 J/Fjvp3X1AKxQQF1NVpjprSMFn6YfPj0ReAR6lD1Hk9IRuCik+9s6/b2f9+EstUoosGY
 nlNyxTyzsSA9MZWo2sjBmiuIU/Cklj6Cybm7JbG27N86fOt4jK5x/ff507LqzAUhN6kV
 +Dlw==
X-Gm-Message-State: AOAM533/SOvYBjc9EEE7nvl5Fula5okft0b8A6aOX6T4y/5LDxjBIaQP
 wZOF9mgjvhB//SintWzROQl5kgrLmMeMRICj+FVutukGv53q69cKHOd/UywHCH0YsBzAJ7vBVIM
 zeRl6QA4REdvikIA=
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr11775969wrs.97.1626430037079; 
 Fri, 16 Jul 2021 03:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJcnzouZ6cYzojNMXC/b35Aa6rQImM5XZoXzVtA7hm/EnjmIcu9Mos57nHrLrv7FEZn2HVqQ==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr11775939wrs.97.1626430036874; 
 Fri, 16 Jul 2021 03:07:16 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 x19sm7621010wmi.10.2021.07.16.03.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 03:07:16 -0700 (PDT)
From: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 02/14] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-3-vsementsov@virtuozzo.com>
Message-ID: <5e3574ea-2d7a-d159-3882-3e627841f368@redhat.com>
Date: Fri, 16 Jul 2021 12:07:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> Adding support of IMGOPTS (like in bash tests) allows user to pass a
> lot of different options. Still, some may require additional logic.
>
> Now we want compression_type option, so add some smart logic around it:
> ignore compression_type=zstd in IMGOPTS, if test want qcow2 in
> compatibility mode. As well, ignore compression_type for non-qcow2
> formats.
>
> Note that we may instead add support only to qemu_img_create(), but
> that works bad:
>
> 1. We'll have to update a lot of tests to use qemu_img_create instead
>     of qemu_img('create'). (still, we may want do it anyway, but no
>     reason to create a dependancy between task of supporting IMGOPTS and
>     updating a lot of tests)
>
> 2. Some tests use qemu_img_pipe('create', ..) - even more work on
>     updating

I feel compelled to again say that we had a series that did exactly 
that.  But of course, now that so much time has passed, overhauling it 
would require quite a bit of work.

> 3. Even if we update all tests to go through qemu_img_create, we'll
>     need a way to avoid creating new tests using qemu_img*('create') -
>     add assertions.. That doesn't seem good.

That almost sounds like you remember my series, because:

https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg00135.html

;)

> So, let's add support of IMGOPTS to most generic
> qemu_img_pipe_and_status().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/iotests.py | 48 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 0d99dd841f..80f0cb4f42 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -16,6 +16,7 @@
>   # along with this program.  If not, see<http://www.gnu.org/licenses/>.
>   #
>   
> +import argparse
>   import atexit
>   import bz2
>   from collections import OrderedDict
> @@ -41,6 +42,19 @@
>   from qemu.machine import qtest
>   from qemu.qmp import QMPMessage
>   
> +
> +def optstr2dict(opts: str) -> Dict[str, str]:
> +    if not opts:
> +        return {}
> +
> +    return {arr[0]: arr[1] for arr in
> +            (opt.split('=', 1) for opt in opts.strip().split(','))}
> +
> +
> +def dict2optstr(opts: Dict[str, str]) -> str:
> +    return ','.join(f'{k}={v}' for k, v in opts.items())
> +
> +
>   # Use this logger for logging messages directly from the iotests module
>   logger = logging.getLogger('qemu.iotests')
>   logger.addHandler(logging.NullHandler())
> @@ -57,6 +71,8 @@
>   if os.environ.get('QEMU_IMG_OPTIONS'):
>       qemu_img_args += os.environ['QEMU_IMG_OPTIONS'].strip().split(' ')
>   
> +imgopts = optstr2dict(os.environ.get('IMGOPTS', ''))
> +
>   qemu_io_args = [os.environ.get('QEMU_IO_PROG', 'qemu-io')]
>   if os.environ.get('QEMU_IO_OPTIONS'):
>       qemu_io_args += os.environ['QEMU_IO_OPTIONS'].strip().split(' ')
> @@ -121,11 +137,41 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
>                                  {-subp.returncode}: {cmd}\n')
>           return (output, subp.returncode)
>   
> +def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
> +    if not args or args[0] != 'create':
> +        return list(args)
> +    args = args[1:]
> +
> +    p = argparse.ArgumentParser(allow_abbrev=False)
> +    # -o option may be specified several times
> +    p.add_argument('-o', action='append', default=[])
> +    p.add_argument('-f')
> +    parsed, remaining = p.parse_known_args(args)
> +
> +    opts = optstr2dict(','.join(parsed.o))
> +
> +    compat = 'compat' in opts and opts['compat'][0] == '0'

I suppose `opts['compat'][0] == '0'` is supposed to check for compat=0.10?

If so, then why not just check `opts['compat'] == '0.10'` to be 
clearer?  I don’t think we allow any other compat=0* values, and I have 
no reason to believe we ever will.

Also, I think compat=v2 is valid, too.  (And I think calling this 
variable “v2” would also make more sense than “compat”.)

> +    for k, v in imgopts.items():
> +        if k in opts:
> +            continue
> +        if k == 'compression_type' and (compat or parsed.f != 'qcow2'):
> +            continue
> +        opts[k] = v

Could also be done with something like

imgopts = os.environ.get('IMGOPTS')
opts = optstr2dict(','.join(([imgopts] if imgopts else []) + parsed.o))

if parsed.f != 'qcow2' or (opts.get('compat') in ['v2', '0.10']):
     opts.pop('compression_type', None)

(Never tested, of course)

Because optstr2dict() prioritizes later options over earlier ones. 
(Which is good, because that’s also qemu-img’s behavior.)

*shrug*

> +
> +    result = ['create']
> +    if parsed.f is not None:
> +        result += ['-f', parsed.f]

Can this even be None?  I hope none of our tests do this.

> +    if opts:
> +        result += ['-o', dict2optstr(opts)]
> +    result += remaining
> +
> +    return result
> +
>   def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
>       """
>       Run qemu-img and return both its output and its exit code
>       """
> -    full_args = qemu_img_args + list(args)
> +    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
>       return qemu_tool_pipe_and_status('qemu-img', full_args)
>   
>   def qemu_img(*args: str) -> int:

There’s also qemu_img_verbose() which I think should be amended the same 
way (even if it’s currently never used for 'create').

Max


