Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC0332727
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 14:28:59 +0100 (CET)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJcPy-0003eL-HB
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 08:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJcBW-0007dJ-Q9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:14:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJcBP-0005T0-6j
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 08:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615295633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jv2uIachcR1lF8T9XbQeT5mS0bIu3gygZzb2xP2tKvQ=;
 b=I5AIsNwzLiX4y+5xeBdlVF01awmMgv5+Ad210j2ovtl1xce/+5asLxiu7pZI2bYrZZGvuA
 4LOG1Q88662WZKbgSRDvtwx3+qw/LjLmqIoCzT8CDs67NB4Im7BNfxs70vP4Trau4kqLW1
 dZ9YfrdaNtY9pWfATXiBf96Fh6S+E10=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-8RlmNWksMUOsn26KSu2EMQ-1; Tue, 09 Mar 2021 08:13:52 -0500
X-MC-Unique: 8RlmNWksMUOsn26KSu2EMQ-1
Received: by mail-wr1-f70.google.com with SMTP id h5so6392051wrr.17
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 05:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jv2uIachcR1lF8T9XbQeT5mS0bIu3gygZzb2xP2tKvQ=;
 b=jwuAtp5bbr2HnW//YKaxQLeE7pNXFcM8S/o4F0YtxcxHkm2lVu+qhHAIjqkduyYhLz
 ZmNbjzNdRhYyAbbuGDHyDNDFZVPZOyC5LLXUkaliVic6aP3H32tP+deMKFWZwLTMipg5
 QvMEc+6F2vkXHwnTbdz7hr77n81E/8lf0ZH86uL6Vy+ccsop7mg9hNHpixOSnmB0Qeo5
 GQUm1lTty/hjD0tMG78uk0V4mBaTJDFYwcaDFfNj7HFkrLYVLTHipYrlkK/0Fr3XC2Ga
 pzDY2ztDyIUOPw4C7flc+tgLGdFVavWNpzIkW/9x7S1/aIZlYdi3mCrgPYubMzTKRv16
 kL2w==
X-Gm-Message-State: AOAM5318Hp87CetnVwLn2BtJiQZJ+aUIU0jEVqp/V4K93vMxlHprBgcV
 TGqI41RpOPX9de4pCqtN5zV1U1CvoloxrLRIHD9qnOT9xfCW7QWGPk5zNaPazYMOxh+B0AwVqOX
 heVPRZOJ6OfUJlJ+2DRE+YH7WLt4aMsw7TihPHdaw4vbgi4Pf7lIryaj5jIK1opn5
X-Received: by 2002:adf:c752:: with SMTP id b18mr27819103wrh.233.1615295631088; 
 Tue, 09 Mar 2021 05:13:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7QyvMc0i3TQ7wm2hKPcWdV5iXCMno0PZJs7CBWnYnk6QnVtdlXjX/sQiJT55SV1ZP3NghKA==
X-Received: by 2002:adf:c752:: with SMTP id b18mr27819070wrh.233.1615295630731; 
 Tue, 09 Mar 2021 05:13:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r7sm24581695wre.25.2021.03.09.05.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 05:13:50 -0800 (PST)
Subject: Re: [PATCH 1/2] curl: Store BDRVCURLState pointer in CURLSocket
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210309130541.37540-1-mreitz@redhat.com>
 <20210309130541.37540-2-mreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f2c39c9a-a8ea-9ef6-e87d-ed30e8070c6f@redhat.com>
Date: Tue, 9 Mar 2021 14:13:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309130541.37540-2-mreitz@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 2:05 PM, Max Reitz wrote:
> A socket does not really belong to any specific state.  We do not need
> to store a pointer to "its" state in it, a pointer to the common
> BDRVCURLState is sufficient.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  block/curl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


