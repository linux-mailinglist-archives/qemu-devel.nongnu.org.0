Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610904A70E5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 13:37:49 +0100 (CET)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFEtQ-0007on-1C
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 07:37:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFEme-0005NH-9J
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 07:30:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFEmY-0005WQ-I7
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 07:30:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643805040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1jONM7iCKpU8cZ9ERTwXXeL7v62/eW4WOA2a7HXn8I=;
 b=bQdq2TLo0ZKmfc4ns/auvyvs8DzFr0zYvvGJ5Jt7oCdpuQpbnQMxqD50wPz+tGuyDvfSyq
 037o+1xpwo0y1Tn+3hGxKlvTJvbcBD1nVqs0hUGOJL+DoOfxRVfXUnP2f2IW0onTgY57qj
 QHtQEc8dlzjtb/8x0Xv8vjQHAe1PMA8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-eD-TuYTAPTWU6otdlJ2K6g-1; Wed, 02 Feb 2022 07:30:39 -0500
X-MC-Unique: eD-TuYTAPTWU6otdlJ2K6g-1
Received: by mail-wr1-f71.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so6828184wrc.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 04:30:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=L1jONM7iCKpU8cZ9ERTwXXeL7v62/eW4WOA2a7HXn8I=;
 b=TV/CfxNmxVjyewbgkLddf+GcTUvl3a4/xM0Httumpn10eQpwQrS3dE8Pmi4kHQlCp+
 LU1610GwwQh5IVOU1WPu/tt+EAALWv4VLZWfQGs2PIFkR1dvcF/7ZQPBskzXSjLIGVbO
 eLE2y5Xjy0bxgRQZyABVd8IuKUZ3+pOAIZqhUThcJswdl1w2cC3+I6iFtVmBFu5g87te
 TBOwWCNwmy1aVsXb1Qm+LstaipBwGA1pE7fAx6KJIBX2k2YQcv35j59bBu2NkqYi3DW7
 rMCIP4lMsNYKq5hBtwluPr2S6WLULWNKO24aGXq3x/Qij3U2VVh941N5C3Yq6U525/15
 M4yg==
X-Gm-Message-State: AOAM533SYuB9Sz85pwbZH/uteWthUzQDJdmCZEwD3Z7PafRZOv3uJbw5
 RDbUT7MQgQ5p3YkcYbYE+WV7PbgpKSq5q+96EMlkngw+TrJsxvThk7ZdfUISohbKuXoHUtyb3Pb
 sBDd0jSp7TYVYpy4=
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr25802749wrb.31.1643805038118;
 Wed, 02 Feb 2022 04:30:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV4oCoyIMf20BfSSIcLdgh4VLPQqhsWq3tEYa9Or1pG3kM9VHQ6BVNtPjNEuOoiM3187emWA==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr25802731wrb.31.1643805037886;
 Wed, 02 Feb 2022 04:30:37 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id s22sm4408356wmj.38.2022.02.02.04.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 04:30:37 -0800 (PST)
Date: Wed, 2 Feb 2022 13:30:35 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: arm: singlestep bug
Message-ID: <20220202123035.sfbpexmqwyj2mnyl@gator>
References: <20220202102832.lwiyc5huddau4i6a@gator> <87a6f9wjd5.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87a6f9wjd5.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ricarkol@google.com, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 11:16:46AM +0000, Alex Bennée wrote:
...
> Side note:
> 
>   ad5fb8830150071487025b3594a7b1bf218d12d8 is the first bad commit
>   commit ad5fb8830150071487025b3594a7b1bf218d12d8
>   Author: Zixuan Wang <zixuanwang@google.com>
>   Date:   Mon Oct 4 13:49:19 2021 -0700
> 
> breaks the running on kvm-unit-test for me, I needed to patch:
> 
> --8<---------------cut here---------------start------------->8---
> modified   run_tests.sh
> @@ -31,7 +31,8 @@ specify the appropriate qemu binary for ARCH-run.
>  EOF
>  }
>  
> -RUNTIME_arch_run="./$TEST_SUBDIR/run"
> +RUNTIME_arch_run="./$TEST_DIR/run"
> +#RUNTIME_arch_run="./$TEST_SUBDIR/run"
>  source scripts/runtime.bash
>  
>  # require enhanced getopt
> --8<---------------cut here---------------end--------------->8---
>

You need to rerun ./configure to get a new config.mak file.

Thanks,
drew


