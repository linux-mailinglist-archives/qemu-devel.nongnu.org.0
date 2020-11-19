Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631802B9DDE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:55:24 +0100 (CET)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfspn-0007ht-EW
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kfsoS-0006oq-UO
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:54:00 -0500
Received: from rev.ng ([5.9.113.41]:54505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1kfsoQ-0004rQ-WC
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 17:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1bpyEN0MvPnNiocUkFqll5XbWuplu3wZZ/qKUif3qt8=; b=rWnANNwrk/zbrfNBrrOU4WGp4h
 FgdMiqhw4Hv5ocz36c86gfNGGlvZKv6n9kkQAhMrKxYX7P+LagIGjlbEuNKSZB6laqQ9lAIorXVYC
 5puXvrKsOIC1ZyZZ7rgKfPHFEY9KSVMDNGObbEJt85xUinjlZ1/UUZehHQQ+17caZOI8=;
Date: Thu, 19 Nov 2020 23:53:39 +0100
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 at.org@qualcomm.com, laurent@vivier.eu, bcain@quicinc.com
Subject: Re: [RFC PATCH v5 22/33] Hexagon (target/hexagon) generater phase 4
 - decode tree
Message-ID: <20201119235339.039ba041@orange>
In-Reply-To: <1604016519-28065-23-git-send-email-tsimpson@quicinc.com>
References: <1604016519-28065-1-git-send-email-tsimpson@quicinc.com>
 <1604016519-28065-23-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Alessandro Di Federico <ale.qemu@rev.ng>
From: Alessandro Di Federico via <qemu-devel@nongnu.org>

On Thu, 29 Oct 2020 19:08:28 -0500
Taylor Simpson <tsimpson@quicinc.com> wrote:

> +if __name__ == '__main__':
> +    f = io.StringIO()
> +    print_tree(f, dectree_normal)
> +    print_tree(f, dectree_16bit)
> +    if subinsn_groupings:
> +        print_tree(f, dectree_subinsn_groupings)
> +    for (name, dectree_subinsn) in sorted(dectree_subinsns.items()):
> +        print_tree(f, dectree_subinsn)
> +    for (name, dectree_ext) in sorted(dectree_extensions.items()):
> +        print_tree(f, dectree_ext)
> +    print_match_info(f)
> +    print_op_info(f)
> +    open(sys.argv[1], 'w').write(f.getvalue())

Is there any specific reason why (here and elsewhere) you use
`StringIO` instead of writing to the file directly?

I'd expect something like:

```
if __name__ == '__main__':
    with open(sys.argv[1], 'w') as f:
        print_tree(f, dectree_normal)
        print_tree(f, dectree_16bit)
        if subinsn_groupings:
            print_tree(f, dectree_subinsn_groupings)
        for (name, dectree_subinsn) in sorted(dectree_subinsns.items()):
            print_tree(f, dectree_subinsn)
        for (name, dectree_ext) in sorted(dectree_extensions.items()):
            print_tree(f, dectree_ext)
        print_match_info(f)
        print_op_info(f)
```

Maybe you're trying to avoid leaving a corrupted file in case of error,
but I guess that's more of a concern for the build system.

Elsewhere, you invoke `.close()`. I'd suggest to use a `with`-statement
there too.

-- 
Alessandro Di Federico
rev.ng

