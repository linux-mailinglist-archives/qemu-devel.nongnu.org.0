Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AB69AE40
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 15:43:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT1w7-0001yR-9n; Fri, 17 Feb 2023 09:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT1w4-0001xk-Oo
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:42:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT1w2-0007GY-Aa
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676644920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AekNVf8smIAovZMUBgmWt1HWQ/3DFD2mt98LNJriAc0=;
 b=OXioXKZlAiu3DfN0swn2z9/+/6OHhDKooU72/da5RdRS1uT1srnV/uKC+EMacIxrwWEEuB
 Gij3zLRlLLRj2a19q0Bu8yESuj+qiZbk8PsWSBB/CyzEabMfD/Df36GmyUtrZNd52Egadv
 YtULgv0gIsrICfmDyanl3QMD7KLyjUA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190--ur9VDfAOh-nJ78Em2zO1g-1; Fri, 17 Feb 2023 09:40:41 -0500
X-MC-Unique: -ur9VDfAOh-nJ78Em2zO1g-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e1e7d3db06so747479wmb.5
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 06:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AekNVf8smIAovZMUBgmWt1HWQ/3DFD2mt98LNJriAc0=;
 b=xXEEGowtGCesPz633FU8nvnzlzXe82VpGqwMgi23lnjxSDXMIq789NDS9gDNFHOqeu
 qVnuK8xgCnxnJDMZVgieBYxG+KziD/iV/wts2B7PwB98tLMofLx7RTswxddaMqU4nrkK
 ZHIIi7fFmkRkevA5JP65lTKM2XmEJ8baP/9Yw/JVik1djt1t7VVHJjq0Zcp0FeSmiBDY
 juTCVXdidm3bvFpttid+Gml6zgU1OltEekIMfWROwQ2dEoPDoQk8C/SWB2beM1ZFUxyV
 0M/Ams4xJvytK8sLkkPKu64dKa8l0hG9poDplDzWTlO/acT+8MZSGnJRnqdPnTVSvPCi
 cpZA==
X-Gm-Message-State: AO0yUKVmgsPIFVkooVxXR8WpIZReIb1jh6HQLGDiSVZCSX78ijBiKxfF
 jpDlmDILT/SufvB57+0iCjzPduYC+NEMP9458LyLlb3Be+8E2vmzJp0REwPuyLwQJoAn8obPzX8
 68UwrlEpwiSO+UP0=
X-Received: by 2002:a05:600c:92a:b0:3dc:573c:6601 with SMTP id
 m42-20020a05600c092a00b003dc573c6601mr970511wmp.36.1676644839430; 
 Fri, 17 Feb 2023 06:40:39 -0800 (PST)
X-Google-Smtp-Source: AK7set8N87XlieF4OjnvrSMzwbN7vEzW4kMUFci1v/lr/DFw3gpUgs9ZioXrIHq1TnAiOEFAvpbqgg==
X-Received: by 2002:a05:600c:92a:b0:3dc:573c:6601 with SMTP id
 m42-20020a05600c092a00b003dc573c6601mr970326wmp.36.1676644834300; 
 Fri, 17 Feb 2023 06:40:34 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 x8-20020a05600c21c800b003dc434b39c7sm1648965wmj.0.2023.02.17.06.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 06:40:33 -0800 (PST)
Message-ID: <d86f3035-e0db-b4ea-06fd-a8c597ae05aa@redhat.com>
Date: Fri, 17 Feb 2023 15:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Proposed way forward Re: [PATCH v2 0/7] Python: Drop support for
 Python 3.6
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <Y+9m6g0MAEfFNUYC@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y+9m6g0MAEfFNUYC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/17/23 12:37, Daniel P. Berrangé wrote:
> 
> So basically I'm suggesting we take a combination of John's series
> here, and Paolo's series. John's last patch would change so that our
> dockerfiles grab docutils with pip instead of disabling docs build
> on centos8. Then look at introducing the use of virtualenvs for auto
> installing any python mods the OS doesn't satisfy.

Sounds good.  I'll post a v3 of this series shortly, in the meanwhile 
I've already posted a suggested update to the support policy, but don't 
plan to drop support for Python 3.6 in 7.0 so that we can give a heads 
up in the release notes.

John is looking at building the virtualenv at configure time, which will 
have the characteristics that you detailed, so both the minimum version 
bump and the virtualenv change would happen in time for 7.1.

Paolo


