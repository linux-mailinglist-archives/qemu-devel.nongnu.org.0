Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9C65EF8B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 16:00:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRiS-0006nU-Mi; Thu, 05 Jan 2023 09:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDRiQ-0006mw-2L
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:59:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDRiO-0006eb-22
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:59:33 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305EKiuA009832
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 14:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4H0T+ZYW69abhbOU6YdBjaUSa30g8J5O9pRsNb9ekes=;
 b=lp42xHublSn9Eq4McyWN84nXnA7a7OsrYwTPU/I/W/6JUSN6Au39GO2HAFai+IBeXBJ0
 vJt49FycByEratQfNrSjY3AQzi2EN8EvXiDJPcbzxP3btJmGp87w3CmETW9XeYui/DXY
 c/0vp7mmpYZDfcurvjr0LegyaV+Ws9UrNsYz9PD3cUY5QRuPKTXsuU+6KmimNatUZHyE
 0pGrUJXnWUhf/3VJBgUK0R8K77106lH6xxCe6w7SQqhQI1oVhRivD1+ZUgl1mO9CzwH9
 YoNR3rEOGVphCgEe7oqfyszHKB+OxweHk+0zOFhHop/r/lO6hw/d8NOHHviyHDkq2pmU IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx07wrw6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:59:28 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305EKt8g010882
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 14:59:28 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mx07wrw6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 14:59:28 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 305EjbQB026064;
 Thu, 5 Jan 2023 14:59:27 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3mtcq7wtqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 14:59:27 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305ExPMr7078476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 14:59:26 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA76D58045;
 Thu,  5 Jan 2023 14:59:25 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A75F58054;
 Thu,  5 Jan 2023 14:59:25 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  5 Jan 2023 14:59:25 +0000 (GMT)
Message-ID: <92288ac5-c850-3d06-d047-0bb5ca1e3397@linux.ibm.com>
Date: Thu, 5 Jan 2023 09:59:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/2] tpm: convert tpmdev options processing to new
 visitor format
Content-Language: en-US
To: James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230105130020.17755-1-jejb@linux.ibm.com>
 <20230105130020.17755-2-jejb@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230105130020.17755-2-jejb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ijvcgm9-WfBEFhTLvLOhondJx35T-uhF
X-Proofpoint-ORIG-GUID: 3ky1KD0TMx3MvJnHKOxfvKBcID1_pB_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050114
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939, SPF_HELO_NONE=0.001,
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



On 1/5/23 08:00, James Bottomley wrote:
> From: James Bottomley <James.Bottomley@HansenPartnership.com>
> 
> Instead of processing the tpmdev options using the old qemu options,
> convert to the new visitor format which also allows the passing of
> json on the command line.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> 
> ---
> v4: add TpmConfiOptions
> ---
>   backends/tpm/tpm_emulator.c    | 24 ++++-----
>   backends/tpm/tpm_passthrough.c | 25 +++-------
>   include/sysemu/tpm.h           |  4 +-
>   include/sysemu/tpm_backend.h   |  2 +-
>   qapi/tpm.json                  | 19 +++++++
>   softmmu/tpm.c                  | 90 ++++++++++++++--------------------
>   softmmu/vl.c                   | 19 +------
>   7 files changed, 76 insertions(+), 107 deletions(-)
> 
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 49cc3d749d..cb6bf9d7c2 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -584,33 +584,28 @@ err_exit:
>       return -1;
>   }
>   
> -static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, QemuOpts *opts)
> +static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, TpmCreateOptions *opts)
>   {
> -    const char *value;
>       Error *err = NULL;
>       Chardev *dev;
>   
> -    value = qemu_opt_get(opts, "chardev");
> -    if (!value) {
> -        error_report("tpm-emulator: parameter 'chardev' is missing");
> -        goto err;
> -    }
> +    tpm_emu->options = QAPI_CLONE(TPMEmulatorOptions, &opts->u.emulator);
> +    tpm_emu->data_ioc = NULL;
>   
> -    dev = qemu_chr_find(value);
> +    dev = qemu_chr_find(opts->u.emulator.chardev);
>       if (!dev) {
> -        error_report("tpm-emulator: tpm chardev '%s' not found", value);
> +        error_report("tpm-emulator: tpm chardev '%s' not found",
> +                opts->u.emulator.chardev);
>           goto err;
>       }
>   
>       if (!qemu_chr_fe_init(&tpm_emu->ctrl_chr, dev, &err)) {
>           error_prepend(&err, "tpm-emulator: No valid chardev found at '%s':",
> -                      value);
> +                      opts->u.emulator.chardev);
>           error_report_err(err);
>           goto err;
>       }
>   
> -    tpm_emu->options->chardev = g_strdup(value);
> -
>       if (tpm_emulator_prepare_data_fd(tpm_emu) < 0) {
>           goto err;
>       }
> @@ -649,7 +644,7 @@ err:
>       return -1;
>   }
>   
> -static TPMBackend *tpm_emulator_create(QemuOpts *opts)
> +static TPMBackend *tpm_emulator_create(TpmCreateOptions *opts)
>   {
>       TPMBackend *tb = TPM_BACKEND(object_new(TYPE_TPM_EMULATOR));
>   
> @@ -972,7 +967,6 @@ static void tpm_emulator_inst_init(Object *obj)
>   
>       trace_tpm_emulator_inst_init();
>   
> -    tpm_emu->options = g_new0(TPMEmulatorOptions, 1);
>       tpm_emu->cur_locty_number = ~0;
>       qemu_mutex_init(&tpm_emu->mutex);
>       tpm_emu->vmstate =
> @@ -990,7 +984,7 @@ static void tpm_emulator_shutdown(TPMEmulator *tpm_emu)
>   {
>       ptm_res res;
>   
> -    if (!tpm_emu->options->chardev) {
> +    if (!tpm_emu->data_ioc) {
>           /* was never properly initialized */
>           return;
>       }
> diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
> index 179697a3a9..4a30143257 100644
> --- a/backends/tpm/tpm_passthrough.c
> +++ b/backends/tpm/tpm_passthrough.c
> @@ -252,21 +252,11 @@ static int tpm_passthrough_open_sysfs_cancel(TPMPassthruState *tpm_pt)
>   }
>   
>   static int
> -tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, QemuOpts *opts)
> +tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, TpmCreateOptions *opts)
>   {
> -    const char *value;
> +    tpm_pt->options = QAPI_CLONE(TPMPassthroughOptions, &opts->u.passthrough);
>   
> -    value = qemu_opt_get(opts, "cancel-path");
> -    if (value) {
> -        tpm_pt->options->cancel_path = g_strdup(value);
> -    }
> -
> -    value = qemu_opt_get(opts, "path");
> -    if (value) {
> -        tpm_pt->options->path = g_strdup(value);
> -    }
> -
> -    tpm_pt->tpm_dev = value ? value : TPM_PASSTHROUGH_DEFAULT_DEVICE;
> +    tpm_pt->tpm_dev = opts->u.passthrough.path ? opts->u.passthrough.path : TPM_PASSTHROUGH_DEFAULT_DEVICE;

WARNING: line over 80 characters
#31: FILE: backends/tpm/tpm_emulator.c:587:
+static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, TpmCreateOptions *opts)

WARNING: line over 80 characters
#102: FILE: backends/tpm/tpm_passthrough.c:255:
+tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, TpmCreateOptions *opts)

ERROR: line over 90 characters
#118: FILE: backends/tpm/tpm_passthrough.c:259:
+    tpm_pt->tpm_dev = opts->u.passthrough.path ? opts->u.passthrough.path : TPM_PASSTHROUGH_DEFAULT_DEVICE;

ERROR: line over 90 characters
#143: FILE: backends/tpm/tpm_passthrough.c:313:
+    options->u.passthrough.data = QAPI_CLONE(TPMPassthroughOptions, TPM_PASSTHROUGH(tb)->options);

total: 2 errors, 2 warnings, 349 lines checked

mssim.v5/0001-tpm-convert-tpmdev-options-processing-to-new-visitor.patch has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.



> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 798e1dc933..8c2655dbc2 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -328,16 +328,6 @@ static QemuOptsList qemu_object_opts = {
>       },
>   };
>   
> -static QemuOptsList qemu_tpmdev_opts = {
> -    .name = "tpmdev",
> -    .implied_opt_name = "type",
> -    .head = QTAILQ_HEAD_INITIALIZER(qemu_tpmdev_opts.head),
> -    .desc = {
> -        /* options are defined in the TPM backends */
> -        { /* end of list */ }
> -    },
> -};
> -
>   static QemuOptsList qemu_overcommit_opts = {
>       .name = "overcommit",
>       .head = QTAILQ_HEAD_INITIALIZER(qemu_overcommit_opts.head),
> @@ -1934,9 +1924,7 @@ static void qemu_create_late_backends(void)
>   
>       object_option_foreach_add(object_create_late);
>   
> -    if (tpm_init() < 0) {
> -        exit(1);
> -    }
> +    tpm_init();
>   
>       qemu_opts_foreach(qemu_find_opts("mon"),
>                         mon_init_func, NULL, &error_fatal);
> @@ -2658,7 +2646,6 @@ void qemu_init(int argc, char **argv)
>       qemu_add_opts(&qemu_boot_opts);
>       qemu_add_opts(&qemu_add_fd_opts);
>       qemu_add_opts(&qemu_object_opts);
> -    qemu_add_opts(&qemu_tpmdev_opts);
>       qemu_add_opts(&qemu_overcommit_opts);
>       qemu_add_opts(&qemu_msg_opts);
>       qemu_add_opts(&qemu_name_opts);
> @@ -2906,9 +2893,7 @@ void qemu_init(int argc, char **argv)
>                   break;
>   #ifdef CONFIG_TPM
>               case QEMU_OPTION_tpmdev:
> -                if (tpm_config_parse(qemu_find_opts("tpmdev"), optarg) < 0) {
> -                    exit(1);
> -                }
> +                tpm_config_parse(optarg);

The comment to v4 still applies:

$ qemu-system-x86_64 --tpmdev help
Supported TPM types (choose only one):
  passthrough   Passthrough TPM backend driver
     emulator   TPM emulator backend driver
        mssim   TPM mssim emulator backend driver
VNC server running on ::1:5900


>                   break;
>   #endif
>               case QEMU_OPTION_mempath:

