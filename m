Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E10A25AA07
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 13:08:09 +0200 (CEST)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDQca-0002ar-G5
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 07:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1kDQba-0001HM-63; Wed, 02 Sep 2020 07:07:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:58536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1kDQbY-0000rX-GM; Wed, 02 Sep 2020 07:07:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45DDEACF2;
 Wed,  2 Sep 2020 11:07:02 +0000 (UTC)
Subject: Re: [PATCH] iotests: Allow running from different directory
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200902110326.257115-1-kwolf@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b2c7e097-c9db-0e9e-446a-2ea52b89673b@suse.de>
Date: Wed, 2 Sep 2020 13:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902110326.257115-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:13:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/20 1:03 PM, Kevin Wolf wrote:
> It is convenient to be able to edit the tests and run them without
> changing the current working directory back and forth. Instead of
> assuming that $PWD is the qemu-iotests build directory, derive the build
> directory from the executed script.
> 
> This allows 'check' to find the required files even when called from
> another directory. The scratch directory will still be in the current
> working directory.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/check | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 3ab859ac1a..22ada6a549 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -44,7 +44,7 @@ then
>          _init_error "failed to obtain source tree name from check symlink"
>      fi
>      source_iotests=$(cd "$source_iotests"; pwd) || _init_error "failed to enter source tree"
> -    build_iotests=$PWD
> +    build_iotests=$(dirname "$0")
>  else
>      # called from the source tree
>      source_iotests=$PWD
> 

Like it, thanks!

Reviewed-by: Claudio Fontana <cfontana@suse.de>

