Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE953FC54F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 12:27:20 +0200 (CEST)
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL0yz-0001e3-B2
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 06:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mL0sF-0007Jm-5a
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 06:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mL0sD-000353-7I
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 06:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630405208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=msBAw3ZvKqshq2WICcsx+b/9T2Wi8pHm3imgBJKoj5Q=;
 b=TibV8YS5OcgkfzkpVi5GaJud80HPvsWvZEHgtCV55uTBn2/SDVspPzt6g6zSboK7E3D921
 XwND99ryONoHK9kB+FyWwLtqGMxsKYX0WqaiOdZ6mdVUtO85G4DltmSei8Clrsc0A7vcGb
 u4n4z1jGP3LWOEgng+0leXOkjxjofK8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-TzAmDXeaMhO_B8WXqIIuzQ-1; Tue, 31 Aug 2021 06:20:06 -0400
X-MC-Unique: TzAmDXeaMhO_B8WXqIIuzQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 m18-20020a170906849200b005c701c9b87cso6929865ejx.8
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 03:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=msBAw3ZvKqshq2WICcsx+b/9T2Wi8pHm3imgBJKoj5Q=;
 b=TSiq3tutYKhoZqdxgJuUKb73EywzrOxdTVJsotMdwgf/bmuckLrgrkrm2OuGOBGT+4
 UeSOxkd9E1Ms4B/vRPwhHulinkFCF4VujD6Co0fO/UsZfXzEw0UL5iQmTqGLGWM7u7UZ
 3A4f6lp3vcx6gKF+u2xrCJUeLtSJ2t7ee3mYgwkTUonMN6qL30/6eYrHSwD8/2vkIa3I
 TnnXIwI6ztX5zM/uuJLUj8wb0DIsoVPXl9glaC5CHgXE4ibbCI97Aqs9wd0WbVU+DeF6
 vg4G4mJYmOk5w+4uDaKDEL56gnbbdRqeqKXo8M9st3W8xx34XpF75iGu0s0oxHEsKhbA
 ssNQ==
X-Gm-Message-State: AOAM533ceiSUoVi6TTLe6OBQdz+2MxYHQY9cOrv/SSTxbZdHOE3aS/rp
 uu8+xxYWa201L/ea1YmHBtfNiJOuvklmJVdD1SnVL+6K/AScTzr8TALuXofxWOnr/a4lBhaoLIj
 MX8YkF9hPqKZs2kM=
X-Received: by 2002:a17:906:3809:: with SMTP id
 v9mr30657263ejc.355.1630405205078; 
 Tue, 31 Aug 2021 03:20:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj7IWaBsn8UsdHvc7HdW23KmoGFe9fPmIYLXhfZiZUjjHUSjDJHP+LjeshBvaEjotEFoTc1g==
X-Received: by 2002:a17:906:3809:: with SMTP id
 v9mr30657245ejc.355.1630405204844; 
 Tue, 31 Aug 2021 03:20:04 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id cr9sm9118339edb.17.2021.08.31.03.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 03:20:04 -0700 (PDT)
Date: Tue, 31 Aug 2021 12:20:02 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v6 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210831102002.baj3yipk7ulvi32i@gator.home>
References: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
 <20210831082940.2811719-2-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210831082940.2811719-2-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 05:29:38PM +0900, Shuuichirou Ishii wrote:
> Add a definition for the Fujitsu A64FX processor.
> 
> The A64FX processor does not implement the AArch32 Execution state,
> so there are no associated AArch32 Identification registers.
> 
> For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.
> 
> The Identification registers value are defined based on the FX700,
> and have been tested and confirmed.
> 
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu64.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>

I already gave my r-b on the last posting, but here it is again

Reviewed-by: Andrew Jones <drjones@redhat.com>


