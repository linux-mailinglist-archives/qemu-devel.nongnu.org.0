Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6A432633A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 14:19:58 +0100 (CET)
Received: from localhost ([::1]:50610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFd2D-0004oH-GC
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 08:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lFczJ-0002gD-3R; Fri, 26 Feb 2021 08:16:57 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lFczH-00069s-B8; Fri, 26 Feb 2021 08:16:56 -0500
Received: by mail-pf1-x436.google.com with SMTP id r5so6208615pfh.13;
 Fri, 26 Feb 2021 05:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Mik0H9XCLPDVUTh+AGn5AvDhKpD0S+U7O9OV4s6qPds=;
 b=n0D0me7f0rT4gzqRpCwq+SapGUiWMSuGI01GM97T0NSvXYTYj9GBHjzBWJGenuFPjH
 fiWr2tHTv630I96quztKTzWC+9rjkASNpf1ieGO1VY37OGFanOFpJGxlQBSdCWi0rt5j
 WqcsKxgEs2j+aIV93CUDGEBXYvL7IWcEh3sTDJO2gEZRDddS3Q1svMextKaCCp03+qbl
 csauXFqYe3k6bfF2uIDsC+5re6A0k2+5o6IfXM33gUtlXZjzPG2JyPOSXUnzUleqDJIF
 y/btesG6B8h/TdbGp8c+fjDJSOpJ6ihL4Vavd2XqcYXzalRSfu5jK7TnuIfFj/btRAxG
 CGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Mik0H9XCLPDVUTh+AGn5AvDhKpD0S+U7O9OV4s6qPds=;
 b=NxWnUn9Neui6+hAqyw2d8jSkxJtjHzpU+bRTHk56KIQkfNd2DMYtOEJ/Flvd15DAbV
 No+xqKBmPZxmJ/X76XM6mxHX5fkuyPklkU6jzYUbPlh7bTgtHt7FhKXCqL2onb1FjblO
 QaNGzm8X10UUVEN6zx4rQyhAA+RjDuuJHVbN3/ANEvJD5lIkz2293tlULpLHdIez7LhB
 CYgYo3MBn3V3YkfkLdr47+d8HryQlgpxmivQhcOqWD7MC1FYYmOdb0DZEUBZdpe1+6ED
 +gilUdn5H+64CC7N+36SBnLzorbF+EzPXX0EgLITIP2tJsO1rIz3mxxrR89frulVTPZ4
 V+0g==
X-Gm-Message-State: AOAM530f5A6Yl0jRDzJ6euXr68KKMZr/cvdipZPRJoUu7BNgt51sLE6h
 ummZFPq9cKnQjw5hFI3arhE=
X-Google-Smtp-Source: ABdhPJzi3QklUkD36glYaHgvZiLsDJBuJI/CTCUt1g+WJ8L/YYhJPtXwmB5tLNb1oGPzG58Auv4IKw==
X-Received: by 2002:a62:144f:0:b029:1ed:9646:736a with SMTP id
 76-20020a62144f0000b02901ed9646736amr3343004pfu.81.1614345413524; 
 Fri, 26 Feb 2021 05:16:53 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x80sm9275765pfc.71.2021.02.26.05.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:16:53 -0800 (PST)
Date: Fri, 26 Feb 2021 22:16:51 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: [PATCH 2/2] hw/block/nvme: add 'nvme_ana_inject_state' HMP command
Message-ID: <20210226131651.GB11808@localhost.localdomain>
References: <20210214112400.26956-1-minwoo.im.dev@gmail.com>
 <20210214112400.26956-3-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210214112400.26956-3-minwoo.im.dev@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-14 20:24:00, Minwoo Im wrote:
> Human Monitor Interface(HMP) is there for easy human debugging.  This
> patch added a HMP command 'nvme_ana_inject_state'.  This can be executed
> from the QEMU monitor.  This command will have the following syntax:
> 
> 	# nvme_ana_inject_state <nvme-id> <anagrpid> <state>
> 	(qemu) nvme_ana_inject_state nvme0 1 inaccessible
> 
> The example above will make ANA group #1 transitioned to
> ANA_INACCESSIBLE state for `nvme0` controller device.  Additionally,
> device will notify to the host that ANA has been changed via
> Asynchronous Event Notifier(AEN).  Then the host will figure out another
> path to I/O for the namespace by reading the log page for ANA
> information again, and this is what we call the multipath I/O.
> 
> This feature is good to debug the host multipath I/O by controlling the
> device ANA group state transition.  The path-related errors can be
> tested and debugged by this feature.  Also, the HMP command interafce
> will make us not to build QEMU itself again to control things in device.
> 
> This interface supports Persistent Loss state transition, but it's not
> going to be persistent: volatile of qemu perspective.
> 
> Cc: Dr . David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>

Hello Keith,

Do you have any comments about this injection method?  As discussed
ealier, I've tried to introduce a natural way to control some of device
status like ANA state which device can behave properly.

It would be great if I can have your feedback on this :)

Thanks!

