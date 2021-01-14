Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00A32F6904
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:14:48 +0100 (CET)
Received: from localhost ([::1]:45024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l078x-0008Vo-KC
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l072i-0003DB-Cm
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:08:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l072f-0005WD-Jq
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610647696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=76s4UVmLzWZxfgvZSODzco4IRauL5fReGpWQJfIDHXA=;
 b=Vm2JKe6ncS8uKIjDm/6F/4p0GxJv6ZsLL1VsuXwzNB6Lm/6UZiGmuUFgED0VZkYN669KAf
 Yj++MaDR2q/4TUXq4840OvRzYiNOui5+7xxR1+EenwU9kvZy1cD1TZN20UA/qUMj6U7bAj
 iB9Y1I5+AKtkZSTSErxphaqpExf+mZw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-c9MkWVvYMWGh2sXcpGCnXw-1; Thu, 14 Jan 2021 13:08:13 -0500
X-MC-Unique: c9MkWVvYMWGh2sXcpGCnXw-1
Received: by mail-wr1-f70.google.com with SMTP id i4so2950508wrm.21
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 10:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=76s4UVmLzWZxfgvZSODzco4IRauL5fReGpWQJfIDHXA=;
 b=FCHelO5PljudO0bmW/eU8W3xfWiBDmWJtQFYJablCCKIOd7WNfYBPhiL3KQpl99xFQ
 cV5ey0pgLj4I+jd/zL1fO5Pj41AdPwLkwelPKI+dutL98Hy2J2yvQd+cEgs6o4GZY1I+
 pnp9n9TPH5g/tgUardc3GAKB57zpliKWxNMO6rptd8L3VK+n5AlaBVnvYiAiDmcWauiJ
 JsS0sWtSoGZMP91lvg1a2mLVxBe6FgN5RkLA7BtsWJ0ZtaUSf8onBxPksgSsHVGpz4hu
 zdvPp+ZTYuWXj4SpGeURXSPGENme0CmPWTg0M7b1RJceTN77ndI+/O1WEow0YOvDL3xQ
 fJKA==
X-Gm-Message-State: AOAM531rhxvHaE+8xLSNDZUxQ4z48nnynELtVihexpQlqgltkNATCQEj
 rs2b+u/xIkXnDGMXI7DXAeoPpzTESodW2pIkXOfUG1UudwgeGSXJ21ee8PDL4uguRO95G4xXKdB
 ASki265xpC3mGQx85r+h+BG0r1+g9T4Gmxqow0N/SnqtIUjcujMN235nskuogFQk1
X-Received: by 2002:a1c:7213:: with SMTP id n19mr5105687wmc.14.1610647692161; 
 Thu, 14 Jan 2021 10:08:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4bMZGnDWVw9L4OUq+P07jcXHCNH1s2N4iaCu04i40PeNuDKZxT88KrYIPa9bMCYqP3NGsmA==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr5105670wmc.14.1610647691968; 
 Thu, 14 Jan 2021 10:08:11 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w18sm11036429wrn.2.2021.01.14.10.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 10:08:11 -0800 (PST)
Subject: Re: [PATCH v2 06/12] Makefile: wrap etags in quiet-command calls
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <643877c5-232b-208a-f679-8838b63f2aed@redhat.com>
Date: Thu, 14 Jan 2021 19:08:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-7-alex.bennee@linaro.org>
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
>  Makefile | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


