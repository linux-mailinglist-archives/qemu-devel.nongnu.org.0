Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE1B1CB184
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 16:13:56 +0200 (CEST)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX3lD-00027F-7e
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 10:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jX3kW-0001PU-9H
 for qemu-devel@nongnu.org; Fri, 08 May 2020 10:13:12 -0400
Received: from 5.mo178.mail-out.ovh.net ([46.105.51.53]:51283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jX3kV-0007ag-2q
 for qemu-devel@nongnu.org; Fri, 08 May 2020 10:13:11 -0400
Received: from player718.ha.ovh.net (unknown [10.110.115.182])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 5B0CF9D5DF
 for <qemu-devel@nongnu.org>; Fri,  8 May 2020 16:13:07 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 8893A12114DA7;
 Fri,  8 May 2020 14:13:02 +0000 (UTC)
Subject: Re: [PATCH] qom/object: Fix object_child_foreach_recursive() return
 value
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200404153340.164861-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <308f6ee1-d09a-ea56-7460-3903aa7d29fe@kaod.org>
Date: Fri, 8 May 2020 16:13:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200404153340.164861-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7562106728072907584
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrkeefgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedukedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.51.53; envelope-from=clg@kaod.org;
 helo=5.mo178.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 10:13:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 4/4/20 5:33 PM, Cédric Le Goater wrote:
> When recursing, the return value of do_object_child_foreach() is not
> taken into account.
> 
> Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> Fixes: d714b8de7747 ("qom: Add recursive version of object_child_for_each")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

What are the plans to merge this one ? 

Thanks,
C. 

> ---
>  qom/object.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index 1812f792247d..b68a707a5e65 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1057,7 +1057,10 @@ static int do_object_child_foreach(Object *obj,
>                  break;
>              }
>              if (recurse) {
> -                do_object_child_foreach(child, fn, opaque, true);
> +                ret = do_object_child_foreach(child, fn, opaque, true);
> +                if (ret != 0) {
> +                    break;
> +                }
>              }
>          }
>      }
> 


