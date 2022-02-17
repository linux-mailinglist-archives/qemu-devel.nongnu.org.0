Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F10C4BA7D7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:13:26 +0100 (CET)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlHR-0005wi-7l
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKkud-0006lO-1A
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:49:51 -0500
Received: from [2a00:1450:4864:20::62b] (port=38805
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKkuY-0007ZZ-EY
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:49:47 -0500
Received: by mail-ej1-x62b.google.com with SMTP id k25so9073017ejp.5
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U77EXb6P2PtDodk5/5hyfXkd24Ya40Da3QojNfYunrw=;
 b=YGzMBRKrNxMZWXwKhwPndObfL6uz2mVs+GS+AmhLTReAHVJThRycO3+J2ymoCV3ziw
 weL2Xu0OviFQdsgYnBzk7IiTB3wGXYiJpr3r6xFzJzI5P34RM1MtWCtIgg4SLT3AtfCs
 1hP8cEHnXFLItmw2eYJPQo2j9EfRttmrctuMf5rS/3nbOLNDEOXRPNoEjKA84VVtqXLJ
 n5A7taHrhhifWbKv2hDc66tBc3DLz0OG+RFEWY4W4HxgS7JVHUWiwQGq5gTb52w4n1oL
 EpRZCjGW50A/tSpxEof3CRgw99fhBzIWLvuDDVYxKVfheVsGbOTH1zu8IVwLE4U4JLlb
 y14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U77EXb6P2PtDodk5/5hyfXkd24Ya40Da3QojNfYunrw=;
 b=PyV+/Wley79XiLJGB1Qm1T5iEMlrIP4ua2N1kVxlhN+yaF6FWBF1uUIPym5PF3qCpU
 RJsLsgDtJbd3rmxFsfh2i4dRVg/Stjl4Hnis4pxyHsoXnFwEGMrnDX0EQrVGq/XSss3z
 dlIfx6F/bNpEeN6wkMfraWN/+rZzu6WhngvrHX7VXxXgy86fY3vagP5iKYFc8zCGDcJf
 dNCzTII4+PkUdag+m0HTYiJ+MJqfoyjscrsOcTnYHJIRr8SDS34NH3dD1Duk4+CUxaB/
 tY43rFndx0Pqt2lldl3of4QbwJFrQfuaSXN914PKaCEdEMqYxt/bsmoxV2YEbxwD7zTu
 47kg==
X-Gm-Message-State: AOAM533ZB42w3GBcpX8mp2AqdtzA3hSCQp62FOotx9WUKWe8jMPMzMKj
 mG6R6adHYJQ8QdPRDWcCdT4=
X-Google-Smtp-Source: ABdhPJyzry0GzvmLnbxW8zBbfXHv2gdbIhYSWS/devZZZeKhhu+4F7eTOSTM7IGINwIE0Dp6TIkvVw==
X-Received: by 2002:a17:906:1e13:b0:6ce:e50c:2a9c with SMTP id
 g19-20020a1709061e1300b006cee50c2a9cmr3198839ejj.546.1645120184451; 
 Thu, 17 Feb 2022 09:49:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id m11sm3754607edc.110.2022.02.17.09.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 09:49:44 -0800 (PST)
Message-ID: <70c04ba7-d617-580d-deaa-97018192e8a6@redhat.com>
Date: Thu, 17 Feb 2022 18:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <CACGkMEvtENvpubmZY3UKptD-T=c9+JJV1kRm-ZPhP08xOJv2fQ@mail.gmail.com>
 <CAJSP0QX6JgCG7UdqaY=G8rc64ZqE912UzM7pQkSMBfzGywHaHg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJSP0QX6JgCG7UdqaY=G8rc64ZqE912UzM7pQkSMBfzGywHaHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, kvm <kvm@vger.kernel.org>,
 Sergio Lopez <slp@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alex Agache <aagch@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, "Florescu,
 Andreea" <fandree@amazon.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, John Snow <jsnow@redhat.com>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 15:01, Stefan Hajnoczi wrote:
> Thanks for this idea. As a stretch goal we could add implementing the
> packed virtqueue layout in Linux vhost, QEMU's libvhost-user, and/or
> QEMU's virtio qtest code.

Why not have a separate project for packed virtqueue layout?

Paolo

