Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F931DD7C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 17:40:40 +0100 (CET)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCPsV-0004Ps-PE
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 11:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCPqP-0003Td-HR
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:38:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lCPqM-0008QZ-G4
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613579905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nB0OWFU5jbOV6+IT4lvi7gr3srohAfDlU936OEJ034Q=;
 b=atSbRGAkZzbhSEfnYqeUD9Ri1ptiIGOEszTpyKAjFTGTD63QoNam8O3ixPUmWe2nx8DA/N
 /5zLFfvXxWrWK71q8o28Ua/+JMXqOYgUHlyZuAS41bQeN+ntbZUpLu90/ZWpUnjH/0a6Sb
 E86VtklMbCaTGiuboH8arVgRmSBAeBQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-l9kvookCOnuizE7T-NW3aA-1; Wed, 17 Feb 2021 11:38:24 -0500
X-MC-Unique: l9kvookCOnuizE7T-NW3aA-1
Received: by mail-wr1-f71.google.com with SMTP id d10so17219833wrq.17
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 08:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nB0OWFU5jbOV6+IT4lvi7gr3srohAfDlU936OEJ034Q=;
 b=V6u4ABZA0J9ipPgH/cXF7fBi/Ic3YixFCNb9XSomVT00nWV6pmeWnNyu6eJx7iUM+k
 U9pm7siSB9ZNUAgeuUuS3XpK3LLir6M19FiDTK5hSJIlegmuiwy5EIAwQDgrAdiI2B+U
 xYbhLyz/oR4mI9wf7cXGsnlOrQVUFiVulScbgnTD3izmxCF9B8wuK/pP/zpeyTvBhxh0
 EAb8QTokMoHn55wpxBX4UIZKqLgA5SmBfHIal3KrOjBwNAEdJWEsdsX2V+gw1eIAco26
 z+NhIMaCIWheYVZd04nFdfN146yzlE1eSXxUy2w//Cq8SCEgm4Uh6/0io/lM8GSVX1n6
 5cuQ==
X-Gm-Message-State: AOAM532b3NjM31R2QneTmS77H/qrDQu8L7VyTT+6RdjbaRLhWbhw1oou
 RvIm4k/y8aYtDlyJVq53ntLJuP0bQ6af62r95c8pdbt21GLWzYkIYBEmXi2WseU+ubQlhwfG8mQ
 AFjvknazC1DRHpN0=
X-Received: by 2002:a5d:618e:: with SMTP id j14mr51945wru.377.1613579901940;
 Wed, 17 Feb 2021 08:38:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSrJn2eyW5wvCOGzMz95g7/6Qyt6kF8dRVDKCW7qqEYW7N+XQNoLLtM/9+l9NX0R5zDbuYIg==
X-Received: by 2002:a5d:618e:: with SMTP id j14mr51922wru.377.1613579901597;
 Wed, 17 Feb 2021 08:38:21 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u14sm4737432wro.10.2021.02.17.08.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 08:38:21 -0800 (PST)
Subject: Re: [PATCH v1 3/6] gitlab-ci.yml: Run check-tcg with TCI
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210217121932.19986-1-alex.bennee@linaro.org>
 <20210217121932.19986-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <077ad40c-4b24-9969-8e41-c8b11581a58e@redhat.com>
Date: Wed, 17 Feb 2021 17:38:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217121932.19986-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 1:19 PM, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> It's now possible to also run the non-x86 TCG tests with TCI.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210127055903.40148-1-thuth@redhat.com>
> ---
>  .gitlab-ci.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


