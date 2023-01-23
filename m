Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8153E6775A4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 08:34:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrKo-0007qr-36; Mon, 23 Jan 2023 02:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrKi-0007mT-8v
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:33:39 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrKf-0007a9-N6
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:33:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so9925426wmb.2
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 23:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ura99djb0EXiahdIcncYjSmjvULWjz1onuodQpmeCZ4=;
 b=sefh0cEAZX+m9SYNJt7dZ+lZXfHX28hwh4YnJT69DerhnAk7wIYwJI26YDR/yLUp4a
 w9LEvdDfHFKPAojh4VxoQGVPZFVUSNeYdKJugI2ZFGVZJGg32IG+YGpXOxKDHfYP6TL8
 zdNFRWOFLwGuTo6Qwf9sIG+GbxdEkS2XFfQGuyYcKg4z2JF9vItjTPZ+ZmS+J/hXr2Th
 34b4XxK+XfFjglWhiga3ETmRDvZXapKokNAgdW3/c+CsyIG6yVdQPaucy5bOdUBo+6jJ
 Rb1iWFPM5pIkaZyd+xQswRmFdZt4Yvf2r/mCX9UJ+nOFJaQM1sZKNtWnGsF/4TCVfnCq
 oqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ura99djb0EXiahdIcncYjSmjvULWjz1onuodQpmeCZ4=;
 b=floAnnNxp7pL7w+ulHOzIuD6Kt2FWMGS1JHsi79jdfJHibuMcCz7wQ9TlusuJBcMZ9
 7bqS1febRxcas2mO6m+Sxxy1/p4FloGd1SgZYByDEjfth+IlBxsAghrXbreL8aQpZF7b
 Mf49ry0nkYf5+BQflb3Z6xIPEv/ou4fxCyALBgpwMpcUwLDFRnlTz1ZnAq0DJceLufCo
 h+W62ZwLyWZmRK2fSPlY7vxqKjHR1fkS+kXcXpitomtkxumr1xt/1ouWpKv7EvUrWyAx
 qcmesWAGuJrDQtaRfx3MhtcJzx0uSN/zW8t4/L7yEhzXO5OenIcye3+sEdG+EiGFHGGb
 S23Q==
X-Gm-Message-State: AFqh2kpTdTZ/48vr5HJAHb0dlLn5z/cuSmf1kAmHv3OmywhSc9F1CAgy
 r+nVwh6J2xe4oM1y+i3cSdAotg==
X-Google-Smtp-Source: AMrXdXthrgQC07xt1sI6b14NFL5y/xyukG3ZpUc8QAyJsjjYHWBor+3AkPClBLDaBg21Gcov6KTRJw==
X-Received: by 2002:a05:600c:1508:b0:3d3:5166:2da4 with SMTP id
 b8-20020a05600c150800b003d351662da4mr22740228wmg.8.1674459211075; 
 Sun, 22 Jan 2023 23:33:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m31-20020a05600c3b1f00b003dafadd2f77sm10809944wms.1.2023.01.22.23.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:33:30 -0800 (PST)
Message-ID: <c6de4517-fb08-3ad2-2cf0-ac0ed1e89ce1@linaro.org>
Date: Mon, 23 Jan 2023 08:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/11] audio: rename hardware store to backend
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
 <20230121094735.11644-3-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230121094735.11644-3-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/1/23 10:47, Volker Rümelin wrote:
> Use a consistent friendly name for the HWVoiceOut and HWVoiceIn
> structures.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio_template.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


