Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD82F62C3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:12:41 +0100 (CET)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03Me-0007HS-9g
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l039H-0000se-Ra
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:58:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l039G-0006X5-8R
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610632726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bhp4iLGI4QsD5sqlSqYy5I5R3D6Q5b2sjyCOn1sCW9E=;
 b=NDBNHdMPEJ+fHHvFdaECjYyKuMYvZneUsQmeIQkzi10n05qBSuslo9gzrjvldK2Pq9WerL
 +0fzsbYpoGaMpjhgjqDqd5DC7eAPsSHZw54ySw9fc5qQ/gb9BIuy2vSjCYEkFjgIgY3Z9t
 tQtfuDElHokSoyPEzSUE4Tb9R7bThQ0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-5l6AhPl3MDWtoh2J0skrRw-1; Thu, 14 Jan 2021 08:58:45 -0500
X-MC-Unique: 5l6AhPl3MDWtoh2J0skrRw-1
Received: by mail-wr1-f72.google.com with SMTP id m20so2639454wrh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:58:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bhp4iLGI4QsD5sqlSqYy5I5R3D6Q5b2sjyCOn1sCW9E=;
 b=U1oZNyDDZ1Y0C5aEVeFkY3/FGKdAev87x/g1aq6KQjTqf7+8J5ZCs8Q47kgVAXLxFg
 SsNGq8uRPj+81cSJG//Ml5q9rxT2GNc7yQxF8r/zLvdhcxAYIPPNs6fWKBkkgN8Kik/z
 V0NbnbMsEkW1GglwzJKm0RwVdJ3WHhr6pXv3iX6bWc23dgtgYVhkEVxeo864KGBNjfua
 hu8ed+8UQvfOpdvtZNJSF/QaDGoU4ZPQsBVQeidd2YpJ2LU+GUeIpDho+55wh21M+e/g
 2mOMdaqNOf/N+LbOcB0558V4y5ACseOTaJskURp4REd0O6LLHkegAEHOqJSjU6Ppe4BC
 rJkQ==
X-Gm-Message-State: AOAM531sSoigeZ/hRcZpnMUkwUc/uPID7Uhvd0HocVUHa7ZVBw0MeG6T
 wLo/N0BVU3o6gLNzVJlZZSsaeG04+aMtN6lIQbL6RFEdYynWLh2rDRuZ8FH3AxOtF5ie64mbPNl
 nDntf+/4ASmtyblI=
X-Received: by 2002:a1c:8157:: with SMTP id c84mr3870656wmd.24.1610632723625; 
 Thu, 14 Jan 2021 05:58:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPSBRHwEVJoAOo9kzGdc6GtP0vFu/o1RjIe+YAjBhhFH1kREk9ngoOE+8R+DX5EPiKLzpDrQ==
X-Received: by 2002:a1c:8157:: with SMTP id c84mr3870647wmd.24.1610632723500; 
 Thu, 14 Jan 2021 05:58:43 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i18sm10386578wrp.74.2021.01.14.05.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:58:42 -0800 (PST)
Subject: Re: [PATCH v2 16/25] tests/docker: expand ubuntu1804 package list
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-17-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1069c3a1-cfec-17a0-10dc-39ffc7f7ab2d@redhat.com>
Date: Thu, 14 Jan 2021 14:58:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-17-berrange@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:02 PM, Daniel P. Berrangé wrote:
> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/ubuntu1804.docker | 57 +++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


