Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1016109F76
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 14:46:56 +0100 (CET)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZbB9-00057E-O3
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 08:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42245)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iZb9C-0004Dw-H3
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 08:44:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iZb9B-0003LF-J1
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 08:44:54 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:53498)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iZb98-0003J9-PR; Tue, 26 Nov 2019 08:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=fAQSXDaN6kiLwvE/abKUnzEEPj+5HNzdoOPjo89ed3E=; 
 b=NvkT7e/96Ut8G20h9qLLPJtq2qE+KRHc/VfZwKKxxCnthtmOVjk+ktpmfb3scLM/V6i/Fs0i0jmuvl2PcJQZP/nCR0f/GA0OomGNjWJ6OXZrU6xky+lqn8aTulZ4MdllHP3q4qn8lt+YMii+QZZqPUp74ereVgA5Um5DFVWy4JQIcyp0foFR4qGL2fnuYaja6Zgw3m+IQgrnQgBT1/rqC33MGumOvlzfE+n/+L4rE5y87U/yrTnWjD5H33cUX6GEMvOrMig7CmxMtRXCSMAavI2+7blj3fCwvF/KB/Ob8TibhHPlWY1q/3GELyOn42ds5YvMvHznbQ+XQPIwlKS/Lw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1iZb95-00066J-Fs; Tue, 26 Nov 2019 14:44:47 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1iZb95-00054Q-DJ; Tue, 26 Nov 2019 14:44:47 +0100
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] blockjob: Fix error message for negative speed
In-Reply-To: <20191126134222.16340-1-kwolf@redhat.com>
References: <20191126134222.16340-1-kwolf@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 26 Nov 2019 14:44:47 +0100
Message-ID: <w51lfs269bk.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 26 Nov 2019 02:42:22 PM CET, Kevin Wolf wrote:
> The error message for a negative speed uses QERR_INVALID_PARAMETER,
> which implies that the 'speed' option doesn't even exist:
>
>     {"error": {"class": "GenericError", "desc": "Invalid parameter 'speed'"}}
>
> Make it use QERR_INVALID_PARAMETER_VALUE instead:
>
>     {"error": {"class": "GenericError", "desc": "Parameter 'speed' expects a non-negative value"}}
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

