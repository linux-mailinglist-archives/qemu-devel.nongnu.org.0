Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61AA2F6974
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:26:38 +0100 (CET)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07KP-0003ss-Jd
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l072q-0003KC-Gt
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:08:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l072p-0005b0-1T
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610647706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ke9QhYhrC+lDDu4UCjwWX26ySdG37yCPp9BdQOiJVNw=;
 b=QaNS5BPT202DJ5to0dZsxg05UwrmYjDat5BPlvctHPqljjGD+F0bCA+TITiJHf1WGz7eSz
 nK5xNMy7/aFoascZY9sEnPcDO986NLD5K+EwHSLtoljPgqJIXe3rfaI5aQCZddYP8+KBXg
 D5/9T7NiGUyqCAoHhW4sDajrPsW4ijg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-fcTCa9_pObe6g5WvEd06jA-1; Thu, 14 Jan 2021 13:08:24 -0500
X-MC-Unique: fcTCa9_pObe6g5WvEd06jA-1
Received: by mail-wr1-f72.google.com with SMTP id v7so2932121wra.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 10:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ke9QhYhrC+lDDu4UCjwWX26ySdG37yCPp9BdQOiJVNw=;
 b=mEi05UpBj3sdFtrrSeb+uPqHkNkGVABhnqE6JZz7NP1n6vu0Jk7jhRrnxcCsKRNT7P
 VYKiVPMpsAOR11Dh4QB+bOVscCJVXj01WLCKmqkS6IGCQ34fyu8y81Dn+rx5+a/QB8nQ
 1qaZky3T/er2XngG6nq/w04dJhOStG12GKLs/tzN6KTtqbyLnD+8Jvz9AdXTgfjpfVZ/
 9GdoDNsengwGT9dUxjBJVCohuZFLFPo2VMAvAh7pj9gDqqUt6TS0YQZ9W82oDbPQe+Vf
 OozpalEXWz9TSHRVi1pdeONMgFeQmBJppiquexZw8i4VAjLZYGAA3RTNVB9L0/IsVjnD
 Nodg==
X-Gm-Message-State: AOAM530z6sP0QGAOCNl6VlBcOlJ4lJEX+fkuMLbJ7xr0DeQUPjeu3lhL
 W0VYXTmACOQaFW8XP0Ptznu0FsHOkDpJR7Zq2BqgFV4jOvDpY+qafUAH8p4DtA4PKjc6SncqQXF
 Wczq42KHREpFLhyjq28EQrMGvIosZtVFv7KKStL/8LVRswQUe7zUT4VFvQbAi4kG0
X-Received: by 2002:a7b:ce14:: with SMTP id m20mr5122554wmc.149.1610647703607; 
 Thu, 14 Jan 2021 10:08:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv8WahUb8y89sgfGVjsxLOGLM1fRsTXyLuP7Uvmsq4MYPNseSHCY8jBt9sptg3HmpPTEXz4w==
X-Received: by 2002:a7b:ce14:: with SMTP id m20mr5122537wmc.149.1610647703411; 
 Thu, 14 Jan 2021 10:08:23 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j15sm11960976wrr.85.2021.01.14.10.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 10:08:22 -0800 (PST)
Subject: Re: [PATCH v2 07/12] Makefile: wrap cscope in quiet-command calls
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ab2d3e63-f88c-e66e-42c7-4ce9c4aea162@redhat.com>
Date: Thu, 14 Jan 2021 19:08:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-8-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 5:57 PM, Alex Bennée wrote:
> For prettier output.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


