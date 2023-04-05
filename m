Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E86D7649
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 10:06:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjy99-0005YE-K6; Wed, 05 Apr 2023 04:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pjy8t-0005XI-Mn
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:05:19 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1pjy8r-0007ZU-TK
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 04:05:19 -0400
Received: by mail-pl1-x631.google.com with SMTP id u10so33708965plz.7
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 01:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680681916;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gG5PZXaUKhRxajyfEHYthrg54Lo1xoJ4el5+xnkywpQ=;
 b=Cbq6KNI0/OeFKQSEW45KTFdQ1+rSavwlG9gO37tP4Sh3uFZOpOoF4T8H+TJnfyw/+j
 VChIWSo09/eEnu3ySsz8neNyglZgDqY7lvj9rjau8d8FcFRphAHiDxA7jxFutCtOCf1C
 tpumZH5f0Ob8+Kffvhu+rLnpru25JaKdQCSIja4vALGyjRYAgHIxklU/v7bc2accLPrn
 XKXwQd6E0sMYmwB2dJ56bP1DMkeufQKAO8TN/t6078lcYrj+jp/3IJuf563Nq34aN+Tg
 /s/Vq7QIC6wWo349tUfmiukLYWZM+aSyPscIk3qRV2ik89XIsIpiwmGb6Tq3HTXRmF89
 BGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680681916;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gG5PZXaUKhRxajyfEHYthrg54Lo1xoJ4el5+xnkywpQ=;
 b=lS/YZZ4hZsfIMA05T+WMGJYsjExHNxD9wMTceQVCdivqtlctM7Ghu+y9qs9/9sVro6
 OtULIg+XAF/H3XZd6gkkoYp8Q6d0OC+nvk2VY6Mb+lv6Enqvtqtf70kropzCkESoKbTr
 SaRFXKB8kDlw+1O5ccACpSTqjMckvtfSA9sHF9JjswHVRwssu7r8P01kdaFt860axdPQ
 MR234z96ZOCSEh+RkU/1DSg03wKazr74Hx4HrJBJmjC6Fig5doEu8mKQ4YTi7MxuGtq6
 nUKH4YSnpMIEZAgLsQfPDTfCZHFeVdu0ckE9I3itKCxU78haCaoWz2bzU8oe3obQitKB
 lifQ==
X-Gm-Message-State: AAQBX9dG3yiuqMNY8A4EUGiFWWMi1jsGRJp9amPjkgUBfZnPZd0qIE3W
 UHKv+A+Neh/uyNjg5JRCKgSDd0xOmo6slHGha00=
X-Google-Smtp-Source: AKy350ZJ1bbwKNRCdYkOTrVTQ+pN4bqMvXPSEwXvqfgJHgfHdmB+v/yBFWMjTYFvTH5cPlfe9/Nq/w==
X-Received: by 2002:a05:6a20:2d96:b0:dd:bf6a:4609 with SMTP id
 bf22-20020a056a202d9600b000ddbf6a4609mr3559565pzb.49.1680681915648; 
 Wed, 05 Apr 2023 01:05:15 -0700 (PDT)
Received: from localhost ([122.172.85.8]) by smtp.gmail.com with ESMTPSA id
 j1-20020aa78d01000000b0062e032b61a8sm6873761pfe.63.2023.04.05.01.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 01:05:14 -0700 (PDT)
Date: Wed, 5 Apr 2023 13:35:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping quirks
Message-ID: <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09-03-23, 14:20, Viresh Kumar wrote:
> Hello,
> 
> This patchset tries to update the vhost-user protocol to make it support special
> memory mapping required in case of Xen hypervisor.
> 
> The first patch is mostly cleanup and second one introduces a new xen specific
> feature.

Can we apply this now ? I have developed code for rust-vmm crates
based on this and we need to get this merged/finalized first before
merging those changes.

Thanks.

-- 
viresh

