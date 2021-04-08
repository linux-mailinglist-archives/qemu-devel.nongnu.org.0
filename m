Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444F358BC5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:56:13 +0200 (CEST)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUYt2-0000S1-3i
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lUYoF-0005B0-4p
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:51:15 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lUYoC-0004L3-6z
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:51:14 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so5169378pjb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 10:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m1y9/GwPZ8btg6K7R8NJR7H4nP9oK9E+e0x/cxSp2FY=;
 b=BeLtw/Jple+wzEE96Y02PREVke5QBHjf4ww+L8qaJxG5ALPPfSlRuiUTI7rzQsbyeV
 uXAgNt6a9ZofHZmYiRV+T9hdp3Id+osjgG1FPTZxzxo6KenMF72kiJ+EWmy7w4KeM9Yh
 uRYv5PcAxMs2tn5tl/zU9eHUcZqVbUKly7/YHyo0j8AynuBlNWkbZMiJajGiEDrv67Y7
 JbVSFVETwKryTOB484m7+H+ja1aUe9PYMBwCTH2Q8ALzHghCvywMllzOhMszOqlszTEQ
 cY2YebVYjP9H4TyNIbdCeCrsbDFg3Qfq1O1G4q0D5bGrXhrM7BX5u7D9Fb+3pogC6MzB
 DE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m1y9/GwPZ8btg6K7R8NJR7H4nP9oK9E+e0x/cxSp2FY=;
 b=hlfrifwyBiApdEsGWSdHCXo0UpuzBHaMg+MJbvZhPrgb8X6mASU9cCIsoknSH4lNpF
 q2WHPJTa5L+N8RsnzOP7wYWzakhY4fKJvYqQ4tUG7czxjFYc7Rr3OfYOD0pEUzSXxHXF
 qljnlpGqt70fw5i2rWwfva9QEVONBEEj5KS0IlZ10fBgV1tpXq157cQPgy3e3aSs4y0b
 9j/9XdpVE0OeVsOC9bQm0RnHSrrSgak7EyJ7nZRP503MswUJHdBRIy8+7GbhxS3OYzfs
 wXgbrwK6zqDJtZoFsQ6Kr3p6uZw8rIvScqjillvrYPGJ3ESva9gd8jaYtdDflGvF8mQu
 pVIg==
X-Gm-Message-State: AOAM5330P61BJCk24H0d5O8JOIt1qsVO32UwxAkfb05MytOYaiGz6RkZ
 qI/N7b7FurdeogVfY8gqFOw=
X-Google-Smtp-Source: ABdhPJzMik10mSiZ0ORzXmNpWx7sX4mQpmCKJOsPT5/jcNHHDeH7Ws+raGS9hBMzCrdb94xlbL3ZQw==
X-Received: by 2002:a17:90a:c788:: with SMTP id
 gn8mr2005833pjb.60.1617904266248; 
 Thu, 08 Apr 2021 10:51:06 -0700 (PDT)
Received: from localhost ([192.55.54.42])
 by smtp.gmail.com with ESMTPSA id x7sm135468pff.12.2021.04.08.10.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 10:51:05 -0700 (PDT)
Date: Thu, 8 Apr 2021 10:49:13 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] checkpatch: Fix use of uninitialized value
Message-ID: <20210408174913.GA218869@ls>
References: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, isaku.yamahata@gmail.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


How about initializing them explicitly as follows?
($realfile ne '') prevents the case realfile eq '' && acpi_testexpted eq ''.
Anyway your patch also should fix it. So
Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>


diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8f7053ec9b..2eb894a628 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1325,8 +1325,8 @@ sub process {
 	my %suppress_whiletrailers;
 	my %suppress_export;
 
-        my $acpi_testexpected;
-        my $acpi_nontestexpected;
+        my $acpi_testexpected = '';
+        my $acpi_nontestexpected = '';
 
 	# Pre-scan the patch sanitizing the lines.
 

On Thu, Apr 08, 2021 at 08:51:19AM +0200,
Greg Kurz <groug@kaod.org> wrote:

> checkfilename() doesn't always set $acpi_testexpected. Fix the following
> warning:
> 
> Use of uninitialized value $acpi_testexpected in string eq at
>  ./scripts/checkpatch.pl line 1529.
> 
> Fixes: d2f1af0e4120 ("checkpatch: don't emit warning on newly created acpi data files")
> Cc: isaku.yamahata@intel.com
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  scripts/checkpatch.pl |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8f7053ec9b26..3d185cceac94 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1532,6 +1532,7 @@ sub process {
>  		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
>  		      (defined($1) || defined($2)))) &&
>                        !(($realfile ne '') &&
> +                        defined($acpi_testexpected) &&
>                          ($realfile eq $acpi_testexpected))) {
>  			$reported_maintainer_file = 1;
>  			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
> 
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

