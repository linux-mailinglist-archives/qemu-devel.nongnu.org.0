Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F295F54DF56
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:43:44 +0200 (CEST)
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1myW-0001KC-1Q
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1meK-0000lk-E5
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:22:52 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:42521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1meJ-0000rb-2J
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:22:52 -0400
Received: by mail-lf1-x12d.google.com with SMTP id h36so1495468lfv.9
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=b/dUCgzwEcx8gJBP3vEfpnUXopVG2LzHle99Z2XPtbo=;
 b=VNNxxkFZ5+/qP0tKDG/Gqf6SVTOsApfQfts1pULBQf0lU4s08+lXOIxkbkuCzT0/Gq
 SgrySmbYsJHUVWFKCUEAgTQAaW+ovHoL7e1q+I3K5wn3BlFeiuF6x1aRgQjmMv+4n/Fs
 Du9IAPUbk5v4096v3HMVcIXnxGhz382Jea724Ra7cvHcq2y8lqRo8xcCT/xjVfYonjpB
 VnR+820OCnat653otts388j/05bc6b6JoFH57iOk1y+eiRIKIuEwpjEavTN+8znLw1g5
 /XvasIhSAm4GrfTkA77ritMJWu4Wodr3hkXZJPedys242CwL8RnZd/dOuJaIA58jWUIn
 ZpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=b/dUCgzwEcx8gJBP3vEfpnUXopVG2LzHle99Z2XPtbo=;
 b=mUgePgJw3Oyc4bOdw8w37TJm4doz9bV/aqi0muIlzPk5H5WMsmO2AmAVTdFSdmXSaQ
 w04MDFpi/duEXmV/cyOJKOLfN4L127mcwkHlm42UJAgRtLs+O2nqHoxhG7uIpznMkT0u
 K5923Qesn5t39R0yidEb5gLzOgRYSZNx+1KDJxkArMVOhpzayL8gRTFg6L/vlwXFJK4Y
 TS2c2F2SfHiMIALioDcC1hPS9+KE9RQCovfgNQbdEYR8rPo/1nM7uu787pT3Fr4DJT/Y
 DB6J6yYdM+h5SpnhdoCKheS1RwAiip0CvukUWUYEZgDNPFiYcNX2vUiTpP3D7p8ZdxY+
 fw/w==
X-Gm-Message-State: AJIora+TWxjIox5KSWO1c7/i+jX3m9JsMGg2vuvGC+mi04qGr/GOauj4
 +qtw+kO5q4pKMIwe0+mfVioY4Q==
X-Google-Smtp-Source: AGRyM1tHZK1+dv+tI3l7IXQ4o/IRyA9Vdl54nG73ys0lNTMELhIJD+OnqMBIb01GzG6j8hpyAg2zmg==
X-Received: by 2002:a05:6512:6d0:b0:47c:6082:9ca3 with SMTP id
 u16-20020a05651206d000b0047c60829ca3mr2311026lff.353.1655374968847; 
 Thu, 16 Jun 2022 03:22:48 -0700 (PDT)
Received: from [192.168.0.101] ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a19f24e000000b00478f3bb79d6sm179635lfk.194.2022.06.16.03.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 03:22:48 -0700 (PDT)
Subject: Re: [PATCH 5/8] Add block part of migration stream
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
 <20220616102006.218693-7-nikita.lapshin@openvz.org>
From: Nikita <nikita.lapshin@openvz.org>
Message-ID: <01d24617-4af1-43ba-17fb-3951a34ec518@openvz.org>
Date: Thu, 16 Jun 2022 13:22:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220616102006.218693-7-nikita.lapshin@openvz.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Sorry, that one wasn't supposed to be sent.


