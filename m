Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B03196CC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:42:43 +0100 (CET)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lALbe-0000QF-4H
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALaT-0008PH-Ok
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:41:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lALaS-0006v4-Cc
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:41:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613086887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4KXTa7q1FAvLJWoIbkbVEqPl/fZEIlz+4RyqnrRgmc=;
 b=TVOB55zgCMcpTceFXWGmXCAIVwqzA+GoMQ5VJfglwFShk1kfF0tvPXg9RltKcN2J4anzOq
 JWp/imFOia8NBGdy95ZcCKLRT7zVuxDRYy5rGKrr1trTRMMXzw4EQKZn23foVcitnA3hB1
 n3HycmKdnSWUea1+qK56LhTYSZreYow=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-aW_fmdQHPKufGk5FAi-YWQ-1; Thu, 11 Feb 2021 18:41:26 -0500
X-MC-Unique: aW_fmdQHPKufGk5FAi-YWQ-1
Received: by mail-wr1-f72.google.com with SMTP id r5so1134689wrw.10
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f4KXTa7q1FAvLJWoIbkbVEqPl/fZEIlz+4RyqnrRgmc=;
 b=hCgovzmBY1D2Q3XrLbqeaY3GNCusdlDIuipXOfPd99k9lYz6BbKbffonqXlHGklmGT
 D4jScL5GfDtVIhd8hc4nzoBiv7hPHzCvjPMHtlgaDA+oEYILqxYYkV4WcjhyT6ZRc4La
 9guLije4NU0GYQevfaB6nlWTcRCZXTl49xSChmraB/D/fEl2YFhrjtA6LNGCO6wg5zQ6
 S8L6CakNEk4P32Nlg4WtNQ++REXUDNunCOL+WpYmK/6V+DuxM652hyeaJYi/sziBkn3x
 BQwyqbkoDPY3PxQzgEmO/+ZGnyUNTXXTwUD1ka55GOmbWNYwyV4eRgoToW85idhRP7OS
 XqIg==
X-Gm-Message-State: AOAM530PinAxUlX1U5iCXJ4KnO3hyWOj2P+wDAvVHZrd4mLtuJPsK5uS
 1XfXsedTdLx0+uVDeuUmhSLUe7cL0bjvK4LGxlv+VEZ/CZQmgKOz7mAt3fzp6Dgp6cHNHhnZhpd
 FMd3SsZfjPFkuwCyUZREFIAgt0Yc6Jhr9eFOmjXKh2fo6LdV2HVWLEHANDMhSFBoC
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr319700wmq.56.1613086884982; 
 Thu, 11 Feb 2021 15:41:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzW1YFJLr4fJLwFNe21zaVErKZsk3M+/44IeoHpEFtVBfhuyDJ172TFLOvCuURtPGrTGK63cA==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr319686wmq.56.1613086884715; 
 Thu, 11 Feb 2021 15:41:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r124sm12348287wmr.16.2021.02.11.15.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 15:41:24 -0800 (PST)
Subject: Re: [PATCH] docs/user: Remove outdated 'Quick Start' section
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20201122000131.18487-1-peter.maydell@linaro.org>
 <CAFEAcA8ZWZUwqstAcg3tw8fAr+SDVXr-puPby_VU9eh4zgBq2w@mail.gmail.com>
 <CAFEAcA8TaDhkmm7uA_XCfs-LG2feRXP5uehH4JKFNSeqOcm4MQ@mail.gmail.com>
 <e6fe3ffc-3e11-df7e-0080-5ab52a94dc56@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <08d4c0df-d451-a36b-c98c-26cc8c799ff5@redhat.com>
Date: Fri, 12 Feb 2021 00:41:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e6fe3ffc-3e11-df7e-0080-5ab52a94dc56@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/11/21 9:27 PM, Laurent Vivier wrote:
> Le 11/02/2021 à 18:02, Peter Maydell a écrit :
>> Laurent: Ping^2 ? Somebody on IRC just now was getting confused by this
>> ancient documentation and its references to nonexistent tarballs..
> 
> Sorry, I didn't see your mail.
> 
> I agree with the change.
> 
> Acked-by: Laurent Vivier <lauren@vivier.eu>

Typo in email (so patchew/b4 get it correct):
Acked-by: Laurent Vivier <laurent@vivier.eu>


