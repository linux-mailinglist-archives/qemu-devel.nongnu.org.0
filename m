Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D24D11EC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 09:16:56 +0100 (CET)
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRV1b-0002Pn-4X
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 03:16:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRUzP-0000sT-KD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:14:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRUzN-00062N-2G
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:14:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646727275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSq58fCjeRdgtuM7qlkKa6J9tS8pIj6rp391XCy9ukA=;
 b=WeDxfkKtTEIMdjKxzY23BaKnbeZIQCrxTW+eiW8m54sn6qlgWZgxC3i42BuGFMWW6HwXCx
 kTpyhQ08DNpOwhhDkBLuaa+b4aves72OVe99bxIODvUf1V7sCvKNrGW/jWa12MhQXvc+L9
 sxnrT6jJ3wHq91CCeDgWc6qg4HYOMMA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-qZG5SdFQPAGM_bhKjNxDgA-1; Tue, 08 Mar 2022 03:14:30 -0500
X-MC-Unique: qZG5SdFQPAGM_bhKjNxDgA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so856440wme.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 00:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GSq58fCjeRdgtuM7qlkKa6J9tS8pIj6rp391XCy9ukA=;
 b=wzkXbhsaSaK+15Y5XxZBPo+Z2urG4S8BjPx0S4zCmerFwkRBfK51KkaJguMIHp82U2
 GXJuu4RzFcLQFiRynrgs8yX+yvPzqB0OdVqXjMaNaV+CsRWWsOAhLu9x/vKrN3diKVLj
 U14GPhiGJxuwUApNEsubcqaaowIgAi15i2O42KtZI0XeBjcwleZUhhL2nBIZD249raCB
 G9KLWpJHA3I+Gb9qcZN7/wFvBmq9dgnNPRMQ5hrI9h1WIkL7iXsmhKbkhk/KGOGfmOWx
 WkfjlsiPcCHAFCjUlYjy+j8TT4B9dC+fBJadvL5A3fpMMzLeCGba8zgI5G1DS0j9orCS
 jNoQ==
X-Gm-Message-State: AOAM532i+PSR9pOwq1nXqmyU2t2HRzYGSamd5eELZBdht8toZ2dxHkKb
 TdMFpW0d8UEm0ZS46RTMXDdHmAby0YWCVf5D2NmlA3WdHqclUCndt6bxIxrPVE8voj5PLSfE5GA
 mn9Huarn+x0Plprg=
X-Received: by 2002:a05:6000:1acc:b0:203:7140:c38c with SMTP id
 i12-20020a0560001acc00b002037140c38cmr551044wry.590.1646727269726; 
 Tue, 08 Mar 2022 00:14:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+cVVT8gyPvkpYZibmeLv6w0Lsgc8yYZfNNFRoySYzUaUS12g9Oa/ueUdFnRtWEaQyM1yBEA==
X-Received: by 2002:a05:6000:1acc:b0:203:7140:c38c with SMTP id
 i12-20020a0560001acc00b002037140c38cmr551027wry.590.1646727269465; 
 Tue, 08 Mar 2022 00:14:29 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b00381807bd920sm1551525wmq.28.2022.03.08.00.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 00:14:28 -0800 (PST)
Message-ID: <e6d0fc5a-c1be-41b7-239c-c5db02f21cf1@redhat.com>
Date: Tue, 8 Mar 2022 09:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PULL 00/23] QEMU changes for 7.0 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220307181633.596898-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 07/03/2022 19.16, Paolo Bonzini wrote:
> The following changes since commit 99c53410bc9d50e556f565b0960673cccb566452:
> 
>    Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2022-02-28' into staging (2022-03-01 13:25:54 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to d170dbb84f8ed8f8c9daa359d6d95cd02fd959b7:
> 
>    gitlab-ci: do not run tests with address sanitizer (2022-03-07 17:41:51 +0100)
> 
> ----------------------------------------------------------------
> * whpx fixes in preparation for GDB support (Ivan)
> * VSS header fixes (Marc-André)
> * 5-level EPT support (Vitaly)
> * AMX support (Jing Liu & Yang Zhong)
> * Bundle changes to MSI routes (Longpeng)
> * More precise emulation of #SS (Gareth)
> * Disable TAP output for check-block
> * Disable ASAN testing
> ----------------------------------------------------------------
[...]
> Paolo Bonzini (5):
>        update meson-buildoptions.sh
>        target/i386: only include bits in pg_mode if they are not ignored
>        linux-headers: include missing changes from 5.17
>        check-block: revert TAP output and reintroduce -makecheck

You now need to revert commit db4b2133b8d ('Quote "case not run" lines in 
TAP mode'), too, which has just been merged yesterday.

But instead of reverting, couldn't we simply go ahead with my series here 
instead to restore the output of failed iotests:

  https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg05031.html

?

  Thomas


