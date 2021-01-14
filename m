Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A812F6206
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:32:07 +0100 (CET)
Received: from localhost ([::1]:47562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02jO-0003a5-MS
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02a2-0003hI-Hs
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02Zr-0007iy-C6
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610630530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKIrKwn/7ue1VF5xYsmsRV8zq2+qucNmJ4aqdFSjoBI=;
 b=Z7Lhw4TPedaWuiKEpUJZyF8ZZChjtqfptTvSn+HxSD+8n1xwruTcjJGB8uDYM74TQQROyC
 A/H5jsmDmSGiIgfguZYLKqW07BfnISmOKJqY6di7oe7tWwRnl/312xDaxCTYZu+Xdj/KR6
 TmqKV799lRwbUT5MbBiwIU65isak2Sk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-a2XmahDNMna29aBAdLDk3g-1; Thu, 14 Jan 2021 08:22:08 -0500
X-MC-Unique: a2XmahDNMna29aBAdLDk3g-1
Received: by mail-wm1-f70.google.com with SMTP id u9so781652wmj.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hKIrKwn/7ue1VF5xYsmsRV8zq2+qucNmJ4aqdFSjoBI=;
 b=FPM6WvesThfx0jQk/sfLsue0lIYnDiIoo0+A3M7tuVuhdhLbRjjiOrE+Ft0e9iF+Zz
 Xh278ySBmGXEpLvZQ4+/uQstVUV0OkoBFvjedrxNQAqdK0K+2nmAx+77Xmbjve0kz30e
 1P1nzbrSVYiqHcQJBPNrsxs4Tw55FqB1gU5u0QxTqh2rr7ZSSfa1SygFOj598LpGO4f2
 BtaM0KGyqe8rOoxeF3h0sOal8AjUCczV1Ch2f+TDw+vIzlYMxiwd3494DygV5BugFkN0
 WVwi7khzc6HMTylrtbELSaPX6BDByG5MOFjTf19lLoPKBwjqpa2xxi2+1DGGALjSgLcX
 B1rA==
X-Gm-Message-State: AOAM5336sCShKHfsjbNFYN+Vi3WxLhoQkGSQf7c4FwDuXD+HNSq3N7qM
 Q+VOQs9lLoKbylQTlolEMt61bQhYcI5d2grab+K1V4+M6L9LfjYjTA6P49hMGPOgyIqf2ghWeRr
 3STx4BG8pWM1+joM=
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr4054932wmj.148.1610630527721; 
 Thu, 14 Jan 2021 05:22:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0b4jnfR85DBRtvZj7kQWjM9qVnIMmrG84vDIdz/V2z08/cTW+1ARraYH5L/icRJIRmg+QOA==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr4054916wmj.148.1610630527546; 
 Thu, 14 Jan 2021 05:22:07 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v14sm9441336wru.8.2021.01.14.05.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:22:06 -0800 (PST)
Subject: Re: [PATCH v2 05/25] tests/docker: remove travis container
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-6-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8022e76c-84ce-7853-29b5-a207d32ae6f3@redhat.com>
Date: Thu, 14 Jan 2021 14:22:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-6-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> The travis container that we have no longer matches what travis
> currently uses. As all x86 jobs are being moved to GitLab CI too,
> there is no compelling reason to update the travis container. It
> is simpler to just remove it.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/devel/testing.rst                 | 14 --------
>  tests/docker/Makefile.include          | 11 ++----
>  tests/docker/dockerfiles/travis.docker | 17 ----------
>  tests/docker/travis                    | 22 ------------
>  tests/docker/travis.py                 | 47 --------------------------
>  5 files changed, 2 insertions(+), 109 deletions(-)
>  delete mode 100644 tests/docker/dockerfiles/travis.docker
>  delete mode 100755 tests/docker/travis
>  delete mode 100755 tests/docker/travis.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


