Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F2E3323B4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:14:27 +0100 (CET)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaJm-0001Y8-65
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJaHQ-0000W0-G5
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJaHP-0004Xg-0d
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615288318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSq0uQJM3VGLkn85Ucx5A9vfuctOxbHHnFeihWCOFZ0=;
 b=Y8qT5FzueE5SfWsmMVJiGEMLe37zN2cF3zEndz/tdAFPlXmNociV+B9/k+4d+Wn3GSqotg
 5Hj8tCYW16BrfAMJS3sSWdMotpqCRVnkH+lrthshN5IeNOVSgbXTHOEnw8T9sA7T1RJo5k
 0cI3m9+0OeQ7PlHlfVHbGsb8l28bPnU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-VeVLtX-QMTKQhkQCv4IwSg-1; Tue, 09 Mar 2021 06:11:56 -0500
X-MC-Unique: VeVLtX-QMTKQhkQCv4IwSg-1
Received: by mail-wm1-f70.google.com with SMTP id z26so987572wml.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:11:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hSq0uQJM3VGLkn85Ucx5A9vfuctOxbHHnFeihWCOFZ0=;
 b=iYAa1f+LAEJ1VAozvYZ1HzgHg4Fclw/5xNBbqAIiy/IEx9aalhjx9msmnsV8x90rcf
 8n/6rQSmF/F2bcjOnhO+UyijzYsCYB7HtMynRPafzRYyGomoZUv8L5/LUHOnrOHKewjY
 41Sn5yyDEu1T4nIectS54ZbT2jYjQSj7JnAPZ+fuPVxaNac29g30f2mOBE2S2oVvCeIJ
 dklTtDtMHdy2izD6wOy4OKaDIYBZM6CnC8O9CShQy45E6lFhnnZaMD0ZTlIiBv8I60QB
 antawHKWYjEt25DZr5+fl9GZorULYBU0XE1fKKqcx3R5gSQs26wuGFz01QfoRkFDIVQD
 Pr+w==
X-Gm-Message-State: AOAM531iAv6eh1FdTtCJDHgULIan94MitBYsWg6LbXo2DqMrl+MxuVIt
 g2iCNsFjDCaDmzrVn7KfgDW8aKMPngPqomdkK+VUTfA9P+7w8JswTTlkr9k0qU6dwnTJM5U1Yyo
 IbiLHwFg/wcj94Fo=
X-Received: by 2002:a05:600c:4112:: with SMTP id
 j18mr3419265wmi.143.1615288315481; 
 Tue, 09 Mar 2021 03:11:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweNhCbrkF6foAUKYyBN/oEqsgjtmdpCXUOQZ0Q/RKs09DZMjeLV3zjBNpvYkIZywZQK1FcGA==
X-Received: by 2002:a05:600c:4112:: with SMTP id
 j18mr3419247wmi.143.1615288315316; 
 Tue, 09 Mar 2021 03:11:55 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z188sm3887227wme.32.2021.03.09.03.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 03:11:54 -0800 (PST)
Subject: Re: [RFC PATCH 3/4] coroutine/mutex: Store the coroutine in the
 CoWaitRecord only once
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210309102157.365356-1-david.edmondson@oracle.com>
 <20210309102157.365356-4-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2df19b64-f52b-5ced-ff08-8072ca4a6714@redhat.com>
Date: Tue, 9 Mar 2021 12:11:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309102157.365356-4-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 11:21 AM, David Edmondson wrote:
> When taking the slow path for mutex acquisition, set the coroutine
> value in the CoWaitRecord in push_waiter(), rather than both there and
> in the caller.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  util/qemu-coroutine-lock.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


