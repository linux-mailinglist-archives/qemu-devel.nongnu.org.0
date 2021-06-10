Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A403A3031
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:08:02 +0200 (CEST)
Received: from localhost ([::1]:48226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNDt-0005aF-5O
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrNAf-0002dZ-V5
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrNAe-0006qI-8r
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623341078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iQ380FKyNNToyET6WmiJrmgXEDaiKB/52vktFYqVUY=;
 b=gK6W2st4XXQ4CQH4JJssWj4q9oSrnTVdurkZvYtnG3hUY5tkwJUrJluN6+615PGAWHitEC
 FaB/Ck9tCGTwB3sb65hXU6U3r6QGzXMNucHJBN0Ti726LYwNwwr5StmWNZC26RGM72tcXr
 MaCJCaRnrn4lbw0gHr9ceMoam9I44ss=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-4UpoMPrzMFKfsEB72RxUQw-1; Thu, 10 Jun 2021 12:04:37 -0400
X-MC-Unique: 4UpoMPrzMFKfsEB72RxUQw-1
Received: by mail-wm1-f72.google.com with SMTP id
 128-20020a1c04860000b0290196f3c0a927so4117703wme.3
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 09:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4iQ380FKyNNToyET6WmiJrmgXEDaiKB/52vktFYqVUY=;
 b=bmPMau/pviN/pyMozZqW4Bfrh3piQlJClrOp4XxjKSvlBIlwkQ7wEPps6EsfKH3bKU
 MLpE7qbMfV2NzPNIi5mPZyurf66EiqxrzrjwxUYQ1vZ8MbuN+rhwFBx0EwQRsYEwikXh
 KVdxtP+DB34QWfeHQe1NYcmhB25vBeJmOXKxcM6AFodMNbOe6601kdAYtGw5EaFCGf6p
 LuCHOhRJqyVNXyqk2hQPvueocyNhdj3Dm15NjgiILt4Q65qD1X4XX6QnJwk3pqK2U0a8
 KDPkV16eEgTDYEg2p5uhvJGxs8rfLzzAhF5rqn0PuCEhK6PPonz+d1gageF4Tgm1IvQl
 T9Kg==
X-Gm-Message-State: AOAM533d9w2it82B5RSRxTUMeybxgtrCu8MBulB7Oz0YaoLxGXHzdlnL
 bPiKUu09POWvQ2DBA2KA31nPXesUBV1ncOnjVq+Gnpga/nDtuLABujg3mzT24cZ10Wn97CJB1gm
 AgCJ8p1RABADHHKs=
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr5821913wma.70.1623341076291; 
 Thu, 10 Jun 2021 09:04:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYEbEGyH2YvLPpnG8MRPGg+s/SkSToxplYCxinjc4fMPoSlKPdogPKRMsvfp0nD+DmNKJodA==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr5821900wma.70.1623341076169; 
 Thu, 10 Jun 2021 09:04:36 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id j34sm3266125wms.7.2021.06.10.09.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 09:04:35 -0700 (PDT)
Subject: Re: [PATCH v2] qga-win: Free GMatchInfo properly
To: Kostiantyn Kostiuk <konstantin@daynix.com>, qemu-devel@nongnu.org
References: <20210610155811.3313927-1-konstantin@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1c458f41-4fdd-5643-ba02-e3836e722aa3@redhat.com>
Date: Thu, 10 Jun 2021 18:04:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610155811.3313927-1-konstantin@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 5:58 PM, Kostiantyn Kostiuk wrote:
> The g_regex_match function creates match_info even if it
> returns FALSE. So we should always call g_match_info_free.
> A better solution is using g_autoptr for match_info variable.
> 
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
> ---
>  qga/commands-win32.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


